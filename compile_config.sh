#!/bin/bash

# We have to list the files that can currently be byte-compiled properly
FILES= \
     ~/.emacs.d/config/startup/emacs.__loadpath.el \
     ~/.emacs.d/config/startup/emacs._00preload.el \
     ~/.emacs.d/config/startup/emacs._02base.el \
     ~/.emacs.d/config/startup/emacs._03keys.el \
     ~/.emacs.d/config/modules/non-packages/emacs.cursor-color.el \
     ~/.emacs.d/config/modules/non-packages/emacs.ediff.el \
     ~/.emacs.d/config/modules/non-packages/emacs.fileident.el \
     ~/.emacs.d/config/modules/non-packages/emacs.indent-tabs.el \
     ~/.emacs.d/config/modules/non-packages/emacs.isearch.el \
     ~/.emacs.d/config/modules/non-packages/emacs.lock-window.el \
     ~/.emacs.d/config/modules/non-packages/emacs.smart-beginning-of-line.el \
     ~/.emacs.d/config/modules/non-packages/emacs.unpop-mark.el \
     ~/.emacs.d/config/modules/non-packages/emacs.window-split-direction.el \
     ~/.emacs.d/config/modules/non-packages/emacs.winner.el

# These are used under certain specific conditions, so make sure they're compiled
FILES+= \
     ~/.emacs.d/wgrep/wgrep-ag.el \
     ~/.emacs.d/package23.x/package.el \
     ~/.emacs.d/config/modules/scripts/guess-style.el

for F in ${FILES} ; do
    # remove any elc files that have already been compiled
    rm -f ${F}c
    # manually recompile
    emacs -batch -f batch-byte-compile ${F}
done
