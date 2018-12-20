;; Gets the available lua-mode package

; This package is included in Emacs 24.x by default
(use-package lua-mode
  ; get it from package.el
  :ensure t
  :commands (
             lua-mode
             )
  :config
  ;; default to camelCase word boundaries
  (add-hook 'lua-mode-hook
            (lambda () (subword-mode 1)))
  )

