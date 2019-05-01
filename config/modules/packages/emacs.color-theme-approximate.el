;; Places line numbers along the left edge.  Numbering is done on each window.

; This package is included in Emacs 24.x by default
(use-package color-theme-approximate
  :ensure t
  :commands (
             color-theme-approximate-on
   )
  :init
    ;; Loads the module and turns it on so it will work if on the terminal
    ;;(autoload 'color-theme-approximate-on "color-theme-approximate")
    ;;(color-theme-approximate-on)
  )

