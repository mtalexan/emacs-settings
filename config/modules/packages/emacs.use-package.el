;; Controls loading of packages so it only occurs if they're needed.
;; Speeds up initial loading.  Only generates a warning if packages are missing,
;; but allows extra logic to occur when package is loaded.

;; add to our package search path so it can find our git submodule
(add-to-list 'load-path
             (concat user-emacs-directory
		             (convert-standard-filename "use-package")))

;; force load the package
(require 'use-package)

