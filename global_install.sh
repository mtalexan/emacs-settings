#!/bin/bash

FILE_VERSION=6.5.6

UBUNTU=0
CENTOS=0

if command -v aptitude ; then
    UBUNTU=1
elif command -v yum ; then
    CENTOS=1
else
    echo "Unrecognized Linux distribution" >&2
    exit 1
fi

if [ $UBUNTU -eq 1 ] ; then
    echo "Using aptitude to install id-utils and exuberant-ctags.  Sudo access required."
    sudo aptitude install -y ncurses-dev id-utils exuberant-ctags
elif [ $CENTOS -eq 1 ] ; then
    echo "Using yum install -y ncurses-devel coreutils ctags.  Sudo access required."
    sudo yum install -y ncurses-devel coreutils ctags
fi

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
echo "Installing GNU Global in /home/${USER}..."
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
echo "Configuring GNU Global for instalation in /home/${USER}/global-${FILE_VERSION}..."
./configure --prefix=/home/${USER}/global-${FILE_VERSION} --with-exuberant-ctags=$(which ctags)
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

echo ""
echo ""
echo "Completed successfully.  gtags is located at $(which gtags)"
echo "Be sure to add the following to your .bashrc:"
echo "   export GTAGSCONF=/home/\$USER/global-${FILE_VERSION}/share/gtags/gtags.conf"
echo "   export GTAGSLABEL=native"
echo "and add to your PATH appropriately."
echo " or"
echo "If cloning common settings, instead put the following in your .bashrc:"
echo "   export GTAGS_INSTALL_DIR=/home/\$USER/global-${FILE_VERSION}"
