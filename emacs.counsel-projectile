;; An alternative to helm or ido, this is really an extension of Ivy

;; really an extension of Ivy
(use-package counsel-projectile
  ; get it from package.el
  :ensure t
  :after (
          counsel
          projectile
   ); after
  :commands (
             counsel-projectile-mode
             counsel-projectile-find-file
             counsel-projectile-find-dir
             counsel-projectile-grep
             counsel-projectile-switch-to-buffer
             counsel-projectile-switch-project
             counsel-projectile-ag ;requires external tool
             counsel-projectile-rg ;requires external tool
   ) ; end :commands
  :init
    ; Don't enable the whole mode, we just want a few key bindings
    ;(counsel-projectile-mode)
  :config
  :bind (
    ; main entry keys
    ("C-x f" . counsel-projectile-find-file)
    ([remap projectile-grep] . counsel-projectile-grep)
    ([remap projectile-switch-project] . counsel-projectile-switch-project)
   ) ;end of :bind
  ) ; end of use-package




