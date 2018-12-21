;; Gets the available lua-mode package

(use-package lua-mode
  :ensure t
  :commands (
             lua-mode
             )
  :config
  ;; default to camelCase word boundaries
  (add-hook 'lua-mode-hook
            (lambda () (subword-mode 1)))
  )

