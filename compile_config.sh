#!/bin/bash

# We have to list the files that can currently be byte-compiled properly
FILES= \
     ./config/startup/emacs.__loadpath.el \
     ./config/startup/emacs._00preload.el \
     ./config/startup/emacs._02base.el \
     ./config/startup/emacs._03keys.el \
     ./config/modules/non-packages/emacs.cursor-color.el \
     ./config/modules/non-packages/emacs.ediff.el \
     ./config/modules/non-packages/emacs.fileident.el \
     ./config/modules/non-packages/emacs.indent-tabs.el \
     ./config/modules/non-packages/emacs.isearch.el \
     ./config/modules/non-packages/emacs.lock-window.el \
     ./config/modules/non-packages/emacs.smart-beginning-of-line.el \
     ./config/modules/non-packages/emacs.unpop-mark.el \
     ./config/modules/non-packages/emacs.window-split-direction.el \
     ./config/modules/non-packages/emacs.winner.el

# These are used under certain specific conditions, so make sure they're compiled
FILES+= \
     ./wgrep/wgrep-ag.el \
     ./package23.x/package.el \
     ./config/modules/scripts/guess-style.el

for F in ${FILES} ; do
    # remove any elc files that have already been compiled
    rm -f ${F}c
    # manually recompile
    emacs -batch -f batch-byte-compile ${F}
done
