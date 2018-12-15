#!/bin/bash


# We have to list the files that can currently be byte-compiled properly

FILES= \
     ~/.emacs.d/config/startup/emacs._00preload.el \
     ~/.emacs.d/config/startup/emacs._02base.el 

# These are used under certain specific conditions, so make sure they're compiled
FILES+= \
     ~/.emacs.d/wgrep/wgrep-ag.el \
     ~/.emacs.d/package23.x/package.el

emacs -batch -f batch-byte-compile ${FILES}
