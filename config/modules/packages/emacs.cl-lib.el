;; Cl-lib is a forward compatibility package to support Emacs 24.x features on 23.x

;; Only if we're running a version prior to emacs 24, add to the load-path
;; and force it to load
(when (< emacs-major-version 24)
  (add-to-list 'load-path
               (concat user-emacs-directory
		               (convert-standard-filename "cl-lib")))
  (require 'cl-lib)
  )
