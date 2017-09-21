#!/bin/bash

APTITUDE=0
YUM=0

if command -v aptitude >/dev/null ; then
    APTITUDE=1
    APTGET=aptitude
    APTMARK=aptitude
elif command -v apt-get >/dev/null ; then
    APTITUDE=1
    APTGET=apt-get
    APTMARK=apt-mark
elif command -v yum >/dev/null ; then
    YUM=1
else
    echo "Unrecognized Linux distribution" >&2
    exit 1
fi

NEW_EMACS_EXECUTABLE_NAME=

if [ $APTITUDE -eq 1 ] ; then
    # Ubuntu has a snapshot repo we can just add to get the latest

    echo "Adding Ubuntu repo for latest Emacs snapshot..."
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


    echo ""
    echo ""
    echo "Getting latest Emacs snapshot..."
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
fi

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


echo ""
echo ""
echo "Creating link for .emacs config"
cd ~ && ln -s .emacs.d/emacs .emacs
if [ $? -ne 0 ] ; then
    echo ""
    echo ""
    echo "Couldn't create symlink from ~/.emacs to ~/.emacs.d/emacs"
    exit 1
fi

echo ""
echo ""
echo "Completed successfully!"
echo "Opening emacs for the first time to allow it to download missing packages"
echo "This may take some time ..."
emacs --debug-init
