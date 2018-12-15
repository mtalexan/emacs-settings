;; Contains only the things that MUST be done before the custom-settings and custom-faces

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

; This is almost deprecated, so conditionaly include it to make it easier to remove later
; It's a backwards compatibility library so the config can be used with older emacs versions
(let ((file "~/.emacs.d/emacs.cl-lib.el"))
  (if (file-executable-p file) (load-file file)))

; We need to initialize package before we load our regular config, and we need the use-package (which
; is cloned as a submodule) in order to use that. 
(load-file "~/.emacs.d/emacs.package.el")

; Do this first, since the rest of the package loading should be making use of it
(load-file "~/.emacs.d/emacs.use-package.el")

; Paradox can/does replace some package stuff with async versions
(load-file "~/.emacs.d/emacs.paradox.el")

;;Load a coding style settings file that can be changed modularly
;;  This should be the only file like this before the custom-set-variables.
;;  We want it here so different settings can be tested through the customize-group
;;  and won't be overridden by these settings.
(let ((file "~/.emacs.d/emacs.codingstyle.el"))
  (if (file-executable-p file) (load-file file)))

