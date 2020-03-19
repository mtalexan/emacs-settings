;; A quick-jump tool for within visible, see Avy as a better alternative

(use-package flycheck
  :ensure t
  :after (
          counsel ; optional
  )
  :commands (
             global-flycheck-mode
             flycheck-next-error
             flycheck-verify-checker
             flycheck-verify-setup
             flycheck-mode
             flycheck-manual
             flycheck-list-errors
             flycheck-buffer
             flycheck-select-checker
             flycheck-compile
             flycheck-disable-checker
             counsel-flycheck
   ) ; end :commands
  :init
    (define-key global-map (kbd "C-c ! c") 'flycheck-buffer)
    (define-key global-map (kbd "C-c ! v") 'flycheck-verify-setup)
    (define-key global-map (kbd "C-c ! s") 'flycheck-select-checker)
    (define-key global-map (kbd "C-c ! C-c") 'flycheck-compile)
    (define-key global-map (kbd "C-c ! x") 'flycheck-disable-checker)
    (define-key global-map (kbd "C-c ! l") 'flycheck-list-errors)
    (if (fboundp 'counsel-flycheck)
        (define-key global-map [remap flycheck-list-errors] 'counsel-flycheck))
  ) ; end of use-package

;; forces install and load with flycheck so it can be used as a checker
(use-package flycheck-cask
  :ensure t
  :after (
          flycheck
          )
  :commands (
             flycheck-mode
   ) ; end :commands
  ) ; end of use-package

;; forces install and load with flycheck so it can be used as a checker
(use-package flycheck-checkbashisms
  :ensure t
  :after (
          flycheck
   )
  :commands (
             flycheck-mode
   ) ; end :commands
  ) ; end of use-package

;; sets up for automatic load when flycheck-mode is started
(use-package flycheck-checkpatch
  :ensure t
  :after (
          flycheck
   )
  :commands (
             flycheck-checkpatch-setup
   ) ; end :commands
  :init
    (eval-after-load 'flycheck '(flycheck-checkpatch-setup))
  ) ; end of use-package

;; sets up for automatic load when flycheck-mode is started
(use-package flycheck-indent
  :ensure t
  :after (
          flycheck
   )
  :commands (
             global-flycheck-inline-mode
             flycheck-indent-setup
   ) ; end :commands
  :init
    (eval-after-load 'flycheck '(flycheck-indent-setup))
  ) ; end of use-package

;; can set up for automatic load when flycheck-mode is started 
(use-package flycheck-inline
  :ensure t
  :after (
          flycheck
   )
  :commands (
             flycheck-inline-mode
   ) ; end :commands
;; If this should be initialized always
;  :init
;    (with-eval-after-load 'flycheck (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
  ) ; end of use-package

;; forces install and load with flycheck so it can be used as a checker
(use-package flycheck-pycheckers
  :ensure t
  :after (
          flycheck
   )
  :commands (
             flycheck-mode
   ) ; end :commands
  ) ; end of use-package

;; forces install and load with flycheck so it can be used as a checker
(use-package flycheck-rust
  :ensure t
  :after (
          flycheck
   )
  :commands (
             flycheck-mode
   ) ; end :commands
  ) ; end of use-package

;; forces install and load with flycheck so it can be used as a checker
(use-package flycheck-tcl
  :ensure t
  :after (
          flycheck
   )
  :commands (
             flycheck-mode
   ) ; end :commands
  ) ; end of use-package

;; forces install and load with flycheck so it can be used as a checker
(use-package flycheck-yamllint
  :ensure t
  :after (
          flycheck
   )
  :commands (
             flycheck-mode
   ) ; end :commands
  ) ; end of use-package
