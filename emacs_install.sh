#!/bin/bash

set -o pipefail

APTITUDE=0
YUM=0
PACMAN=0
AURPAC=""

if command -v aptitude >/dev/null ; then
    APTITUDE=1
    APTGET=aptitude
    APTMARK=aptitude
    APTCACHE=aptitude
elif command -v apt-get >/dev/null ; then
    APTITUDE=1
    APTGET=apt-get
    APTMARK=apt-mark
    APTCACHE=apt-cache
elif command -v yum >/dev/null ; then
    YUM=1
elif command -v pacman >/dev/null ; then
    PACMAN=1
    if command -v pacaur > /dev/null ; then
        AURPAC=pacaur
    elif command -v yaourt > /dev/null ; then
        AURPAC=yaourt
    elif command -v yay > /dev/null ; then
        AURPAC=yay
    else
        echo "An AUR capable package manager is required: e.g. pacaur, yaourt, or yay"
	exit 1
    fi
else
    echo "Unrecognized Linux distribution" >&2
    exit 1
fi

NEW_EMACS_EXECUTABLE_NAME=

if [ $APTITUDE -eq 1 ] ; then
    # Ubuntu has a snapshot repo we can just add to get the latest

    echo "Adding Ubuntu repo for latest Emacs snapshot..."
    # check if it's already added
    if [ -z "$(find /etc/apt -name '*.list' -exec grep -E '^[^#]+ubuntu-elisp/ppa' {} \;)" ] ; then
        if command -v apt-add-repository ; then
            sudo apt-add-repository ppa:ubuntu-elisp/ppa
            if [ $? -ne 0 ] ; then
                echo ""
                echo ""
                echo "Unable to add repository"
                exit 1
            fi
        else
            echo "Tool apt-add-repository not available!" >&2
            exit 1
        fi

        sudo ${APTGET} update
        if [ $? -ne 0 ] ; then
            echo ""
            echo ""
            echo "Unable to update ${APTGET} database"
            exit 1
        fi
    fi

    echo ""
    echo ""
    echo "Getting latest Emacs snapshot..."
    #check if it's already installed
    if ! dpkg -l emacs-snapshot 2>/dev/null | grep -qE '.i.[ ]+emacs-snapshot[ ]+' &>/dev/null ; then
        sudo ${APTGET} install -y emacs-snapshot
        if [ $? -ne 0 ] ; then
            echo ""
            echo ""
            echo "Unable to install emacs-snapshot"
            exit 1
        fi

        echo ""
        echo ""
        echo "Setting emacs-snapshot to remain unchanged..."
        sudo ${APTMARK} hold emacs-snapshot
        if [ $? -ne 0 ] ; then
            echo ""
            echo ""
            echo "Unable to mark emacs-snapshot to hold against updates"
            exit 1
        fi
    fi

    # the installed executable to set as the "emacs" version
    NEW_EMACS_EXECUTABLE_NAME=$(which emacs-snapshot)

elif [ $YUM -eq 1 ] ; then
    # Fedora, CentOS, etc don't have a snapshot repo, so we have to build from source

    # get the list of deps for the emacs package, but exclude any sub-packages named emacs
    DEPS=$(yum deplist emacs | awk '/provider:/ {print $2}' | sort -u | grep -v emacs | sed -e "s@[.]$(uname -i)@@g" -e "s@[.]noarch@@g" )


    # we need the development versions of these packages too so we can build against them
    DEVEL_DEPS=autoconf automake
    for D in $DEPS ; do
        DEVEL_DEPS="${DEVEL_DEPS} ${D}-devel"
    done

    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Unable to determine dependencies for a generic emacs install"
        exit 1
    fi

    # install emacs so we get all the dependencies
    sudo yum install -y $(DEPS) ${DEVEL_DEPS}
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Unable to install emacs dependencies"
        exit 1
    fi

    EMACS_GIT_REPO=https://git.savannah.gnu.org/git/emacs.git
    # clone the source for the emacs repo
    git clone --recursive --depth=1  ${EMACS_GIT_REPO} emacs-src
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Unable to clone emacs repo from ${EMACS_GIT_REPO}"
        exit 1
    fi

    # go into the cloned directory
    cd emacs-src

    # fetch all available tags so we can parse them
    git fetch --tags

    # Parse the tags, and determine the latest non-RC release
    #    release tags are like "emacs-25.2.34" or "emacs-25.2" or "emacs-25.2-rc3"
    VERSION=$(git tag -l | grep -E 'emacs-[0-9]+([.][0-9]+)+$' | sort | tail -n1)
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Unable to determine latest tagged release version"
        exit 1
    fi

    git checkout $VERSION
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Cannot checkout git tag ${VERSION} in the emacs repo clone"
        exit 1
    fi

    # run autogen to setup for the build
    ./autogen.sh
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Error running autogen for ${VERSION}, see errors above"
        exit 1
    fi

    # make sure the emacs version of ctags doesn't overwrite any sintall ctags version
    ./configure --without-makeinfo --program-transform-name='s/^ctags$/ctags.emacs/'
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Error configuring ${VERSION}, see errors above"
        exit 1
    fi

    make -j $(nproc)
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Error builiding ${VERSION}, see errors above"
        exit 1
    fi

    sudo make install
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Error installing ${VERSION}, see errors above"
        exit 1
    fi

    #parse down to only the part of the version that would be on the executable
    EXE_VERSION=$(echo $VERSION | grep -Eo "emacs-[0-9]{2}[.][0-9]+")

    # add the newly installed version to the alternatives list
    sudo update-alternatives --install /usr/bin/emacs emacs /usr/local/bin/${EXE_VERSION} 10
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Error adding ${EXE_VERSION} as an alternative"
        exit 1
    fi

    # the installed executable to set as the "emacs" version
    NEW_EMACS_EXECUTABLE_NAME=/usr/local/bin/${EXE_VERSION}

    # cleanup by deleting the source repo
    cd ..
    rm -rf emacs-src
elif [ $PACMAN -eq 1 ] ; then
    if ! pacman -Q emacs > /dev/null ; then
	echo "Installing emacs from pacman, sudo access required" 
        sudo ${AURPAC} -Sy emacs
        if [ $? -ne 0 ] ; then
            echo ""
            echo ""
            echo "Unable to install emacs from ${AURPAC}"
            exit 1
	fi
    fi

    NEW_EMACS_EXECUTABLE_NAME=$(which emacs)
fi

if [ $PACMAN -ne 1 ] ; then
    echo ""
    echo ""
    echo "Updating alternatives to use emacs-snapshot..."
    sudo update-alternatives --set emacs ${NEW_EMACS_EXECUTABLE_NAME}
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Unable to update emacs alternative to ${NEW_EMACS_EXECUTABLE_NAME}"
        exit 1
    fi
fi


echo ""
echo ""
echo "Creating link for .emacs config"
cd ~ && ln -sf .emacs.d/config/emacs .emacs
if [ $? -ne 0 ] ; then
    echo ""
    echo ""
    echo "Couldn't create symlink from ~/.emacs to ~/.emacs.d/config/emacs"
    exit 1
fi

if [ $PACMAN -eq 1 ] ; then
    if ! pacman -Q ripgrep > /dev/null ; then
        sudo ${AURPAC} -Sy ripgrep
	if [ $? -ne 0 ] ; then
            echo ""
            echo ""
            echo "Couldn't install ripgrep from ${AURPAC}"
	    exit 1
        fi
    fi
else
    echo ""
    echo ""
    echo "Installing ripgrep"
    if ! command -v rg &>/dev/null ; then
        if command -v dpkg &>/dev/null ; then
            RIPGREP_VERSION=0.10.0
        
            if ! wget https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}_amd64.deb ; then
                echo "ERROR: unable to get the ripgrep deb file"
                exit 1
            fi
            #install it
            sudo dpkg -i ripgrep_${RIPGREP_VERSION}_amd64.deb
            #clean it up
            rm ripgrep_${RIPGREP_VERSION}_amd64.deb
        else
            echo "    Manual install required: https://github.com/BurntSushi/ripgrep/releases"
           echo ""
        fi
    fi
fi

echo ""
echo ""
echo "Completed successfully!"
echo "Opening emacs for the first time to allow it to download missing packages."
echo "Note that this may result in warnings.  Once completed, simply exit emacs and the additional"
echo "packages will be downloaded with a second invocation."
echo "This may take some time ..."
# Force it to re-initialize the packages immediately, otherwise
# it won't have the new elpa and melpa repos.
# We have to do this on the first time opening/running it or use-package won't find the
# missing package dependencies it needs to download and install.
# Compiling these packages frequently produces warnings though, so we can't do --debug-init.
# We do it twice with the refresh because it's pretty common to get an erroneous missing dependency
# compile error on some of the packages during the first run, that are resolved by simply exiting
# and re-running the same thing.
emacs --execute='(package-refresh-contents)'
emacs --execute='(package-refresh-contents)'
emacs --debug-init
