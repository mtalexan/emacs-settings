#!/bin/bash

set -o pipefail

# Minimum version needed, also the version of the source downloaded if no package is available
FILE_VERSION=6.5.6

APTITUDE=0
YUM=0

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
else
    echo "Unrecognized Linux distribution" >&2
    exit 1
fi

if [ $APTITUDE -eq 1 ] ; then
    echo "Using ${APTGET} to install id-utils and exuberant-ctags.  Sudo access required."

    #worst case we update these, but ncurses-dev is a metapackage and therefore has no matching dpkg to check for
    sudo ${APTGET} install -y ncurses-dev id-utils exuberant-ctags

    PACKAGE_VERSION=$(${APTCACHE} show global | grep "^Version" | awk '{print $2}' | sed -e 's@^\([0-9.]*\).*@\1@g')

    #make sure the correct version of ctags is being used, in case Emacs was already installed and added it's idiotic ctags version
    CTAGS_PATH=$(update-alternatives --list ctags | grep "exuberant" | head -n1)
    #if we don't have other alternatives it may not return 0 and we won't be able to set it
    if [ $? -eq 0 ] ; then
        echo ""
        echo ""
        echo "Updating alternatives to use exuberant-ctags..."
        sudo update-alternatives --set ctags ${CTAGS_PATH}
        if [ $? -ne 0 ] ; then
            echo ""
            echo ""
            echo "Unable to update ctags alternative to ${CTAGS_PATH}"
            exit 1
        fi
    else
        echo ""
        echo ""
        echo "Error, cannot locate exuberant-ctags version of ctags tool"
        exit 1
    fi

elif [ $YUM -eq 1 ] ; then
    echo "Using yum to install ncurses-devel coreutils ctags.  Sudo access required."
    sudo yum install -y ncurses-devel coreutils ctags

    PACKAGE_VERSION=$(yum list global | grep global | awk '{print $2}' | sed -e 's@[0-9]*:\(.*\)@\1@' -e 's@^\([0-9.]*\).*@\1@g')
fi

# Lexigraphically sort the required FILE_VERSION and the PACKAGE_VERSION to determine which is newer.
# If the newer version matches the PACKAGE_VERSION, use the package manager to get and use it.
# Also works if PACKAGE_VERSION matches FILE_VERSION
if [[ ${PACKAGE_VERSION} == $(echo "${FILE_VERSION}" "${PACKAGE_VERSION}" | sort -u | tail -n1) ]] ; then
    from_source=0
else
    from_source=1
fi

if [ from_source -eq 0 ] ; then
    # It's available as a package, use that

    if [ $APTITUDE -eq 1 ] ; then
        echo "Using aptitude to install global.  Sudo access required."
        sudo aptitude install -y global
        INSTALL_DIR=/usr/local/share
    elif [ $YUM -eq 1 ] ; then
        echo "Using yum to install global.  Sudo access required."
        sudo yum install -y global

        INSTALL_DIR=/usr

        if [ ! -e ${INSTALL_DIR}/share/gtags/gtags.conf ] ; then
            # for some reason the rpm installs gtags.confg in /etc rather than under /usr/share/gtags/
            # but we assume it's under ${INSTALL_DIR}/share/gtags/ since that's what the source build
            # does.  Symlink it so it works
            echo "Creating symlink for gtags.conf.  Sudo access required."
            sudo ln -s /etc/gtags.conf ${INSTALL_DIR}/share/gtags/gtags.conf
        fi
    fi
else
    #get it from the source snapshot instead

    INSTALL_DIR=/home/$USER/global-${FILE_VERSION}

    echo ""
    echo ""
    echo "Getting GNU Global ${FILE_VERSION}..."
    cd /tmp && wget ftp://ftp.gnu.org/pub/gnu/global/global-${FILE_VERSION}.tar.gz

    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Error retrieving package, aborting install"
        exit 1
    fi

    echo ""
    echo ""
    echo "Installing GNU Global in ${INSTALL_DIR}..."
    cd ~ && tar -xzf /tmp/global-${FILE_VERSION}.tar.gz
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Error extracting /tmp/global-${FILE_VERSION}.tar.gz to ~"
        exit 1
    fi

    cd global-${FILE_VERSION}

    ctags --version | grep -q "Emacs"
    if [ $? -eq 0 ] ; then
        echo ""
        echo ""
        echo "Ctags version found in path is an Emacs version (incorrect).  Adjust PATH and try again"
        exit 1
    fi

    echo ""
    echo ""
    echo "Configuring GNU Global for instalation in ${INSTALL_DIR}..."
    ./configure --prefix=${INSTALL_DIR} --with-exuberant-ctags=$(which ctags)
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Failed to configure"
        exit 1
    fi

    echo ""
    echo ""
    echo "Building GNU Global..."
    make
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Failed to build"
        exit 1
    fi

    echo ""
    echo ""
    echo "Installing GNU Global. Sudo permissions required."
    sudo make install
    if [ $? -ne 0 ] ; then
        echo ""
        echo ""
        echo "Failed to install"
        exit 1
    fi

    #clean up file we successfully extracted only after successful install so
    #repeated runs don't need to actually download the file each time
    rm -f /tmp/global-${FILE_VERSION}.tar.gz
fi

echo ""
echo ""
echo "Completed successfully.  gtags is located at $(which gtags)"
echo "Be sure to add the following to your .bashrc:"
echo "   export GTAGSCONF=${INSTALL_DIR}/share/gtags/gtags.conf"
echo "   export GTAGSLABEL=native"
echo "and add to your PATH appropriately."
echo " or"
echo "If cloning common settings, instead put the following in your .bashrc:"
echo "   export GTAGS_INSTALL_DIR=${INSTALL_DIR}"
