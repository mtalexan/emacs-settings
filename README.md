To use the repo, clone it to ~/.emacs.d and then create a symlink from ~/.emacs to ~/.emacs.d/emacs

After cloning, you'll need to do "git submodule update --init" as well.

Changes which should not be shared should be placed in a ~/.emacs.d/emacs.local file that will get imported (if present) into the main emacs script.

use-package should be used when possible as it significantly speeds up loading.

The format of these changes is to provide a main emacs file with core functionality and configuration.  Packages should be pulled in via an emacs.packagename configuration file so they can be modularly controlled and configured.  All configuration and the actual loading of the module itself should occur in this package specific file.


