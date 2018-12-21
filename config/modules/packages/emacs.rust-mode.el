;; Rust major mode

(use-package rust-mode
  :ensure t
  :commands (
     rust-mode
   ) ; end :commands
  :config
    ;; auto-format on save
    (setq rust-format-on-save t)
  :bind (
    ) ;end of :bind
  ) ; end of use-package
