;; An avy plugin to do ace-jump-like-behavior to flycheck errors
(use-package avy-flycheck
  :ensure t
  :requires (
             flycheck
             avy
   )
  :after (
          flycheck
          avy
   )
  :commands (
             avy-flycheck-setup
             avy-flycheck-goto-error
   ) ; end :commands
  :init
    (define-key global-map (kbd "C-c ! g") 'avy-flycheck-goto-error)
  ) ; end of use-package
