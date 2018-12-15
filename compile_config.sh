#!/bin/bash

emacs -batch -f batch-byte-compile ~/.emacs.d/config/**/*.el
# These are used under certain specific conditions, so make sure they're compiled
emacs -batch -f batch-byte-compile ~/.emacs.d/wgrep/wgrep-ag.el
emacs -batch -f batch-byte-compile ~/.emacs.d/package23.x/package.el
