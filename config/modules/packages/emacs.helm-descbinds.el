;; Helm interface to search key bindings.  Hit C-h after a prefix key to see all bindings

(use-package helm-descbinds
  ; only use this if helm is loaded
  :requires helm
  ; get it from package.el
  :ensure t
  :after (
          helm
   )
  :init
    ; always use this
    (require 'helm-descbinds)
  :config
    (helm-descbinds-mode)
  ) ; end of use-package
