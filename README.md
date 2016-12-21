To use the repo, clone it to ~/.emacs.d and then create a symlink from ~/.emacs to ~/.emacs.d/emacs
After cloning, do "git submodule update --init" in the .emacs.d directory, then open emacs with the --debug-init option.  This will download any missing packages via package.el from the ELPA repos, as well as confirming all the emacs configuration settings are working properly.

Changes which should not be shared should be placed in a ~/.emacs.d/emacs.local file that will get imported (if present) into the main emacs script.

use-package should be used when possible as it significantly speeds up loading.

The format of these changes is to provide a main emacs file with core functionality and configuration.  Packages should be specified in an emacs.packagename configuration file, ideally using the use-package syntax, so they can be modularly controlled and configured.  All configuration and the actual loading of the module itself should occur in this package specific file.  If the package itself is not part of package.el, the package file itself should also be checked in.


