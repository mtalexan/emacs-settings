;; Contains only the things that MUST be done before the custom-settings and custom-faces

; This is almost deprecated, so conditionaly include it to make it easier to remove later
; It's a backwards compatibility library so the config can be used with older emacs versions
(let ((file "emacs.cl-lib"))
  (if (file-executable-p file) (load file)))

; We need to initialize package before we load our regular config, and we need the use-package (which
; is cloned as a submodule) in order to use that. 
(load "emacs.package")

; Do this first, since the rest of the package loading should be making use of it
(load "emacs.use-package")

; Paradox can/does replace some package stuff with async versions
(load "emacs.paradox")

;;Load a coding style settings file that can be changed modularly
;;  This should be the only file like this before the custom-set-variables.
;;  We want it here so different settings can be tested through the customize-group
;;  and won't be overridden by these settings.
(let ((file "emacs.codingstyle"))
  (if (file-executable-p file) (load file)))

