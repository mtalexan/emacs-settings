#!/bin/bash

echo "Adding Ubuntu repo for latest Emacs snapshot..."
sudo apt-add-repository ppa:ubuntu-elisp/ppa
if [ $? -ne 0 ] ; then
    echo ""
    echo ""
    echo "Unable to add repository"
    exit 1
fi

sudo apt-get update
if [ $? -ne 0 ] ; then
    echo ""
    echo ""
    echo "Unable to update apt-get database"
    exit 1
fi


echo ""
echo ""
echo "Getting latest Emacs snapshot..."
sudo apt-get install emacs-snapshot
if [ $? -ne 0 ] ; then
    echo ""
    echo ""
    echo "Unable to install emacs-snapshot"
    exit 1
fi


echo ""
echo ""
echo "Setting emacs-snapshot to remain unchanged..."
sudo apt-mark hold emacs-snapshot
if [ $? -ne 0 ] ; then
    echo ""
    echo ""
    echo "Unable to mark emacs-snapshot to hold against updates"
    exit 1
fi

echo ""
echo ""
echo "Updating alternatives to use emacs-snapshot..."
sudo update-alternatives --set emacs `which emacs-snapshot`
if [ $? -ne 0 ] ; then
    echo ""
    echo ""
    echo "Unable to update emacs alternative to `which emacs-snapshot`"
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
