;; Setups up quick-help text to appear in the mini-buffer when idling on company completions

(use-package company-quickhelp
  :ensure t
  :after (
          company
          )
  :requires company
  :config
    ;; No real reason to have major delay
    (setq company-quickhelp-idle-delay 0.3)
  )

