#!/bin/bash

FILE_VERSION=6.5.6

echo "Using apt-get to install id-utils and exuberant-ctags.  Sudo access required."
sudo apt-get install id-utils exuberant-ctags

echo ""
echo ""
echo "Getting GNU Global 6.5.6..."
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
echo "Configuring GNU Global for instalation in /home/${USER}/global-6.5.6..."
./configure --prefix=/home/${USER}/global-${FILE_VERSION} --with-exuberant-ctags=`which ctags`
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
echo "Completed successfully.  gtags is located at `which gtags`"
