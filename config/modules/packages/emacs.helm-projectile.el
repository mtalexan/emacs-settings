;; Helm interface to Projectile requires both

(use-package helm-projectile
  ;; only use this if both helm and projectile are present
  :requires (helm projectile)
  :ensure t
  :after (
          helm
          projectile
   );after
  :commands (
             helm-projectile-find-file
             helm-projectile-find-other-file
             helm-projectile-find-file-dwim
             helm-projectile-find-file-map
   )
  :init
    (setq projectile-completion-system 'helm)
  :config

  :bind (
    ;; find files looking at all within the projectile project
    ("C-x f" . helm-projectile-find-file)
    ;; find matching header/source in pair
    ([remap projectile-find-other-file] . helm-projectile-find-other-file)
    ;; find file under point, or default to find-file
    ("C-c f" . helm-projectile-find-file-dwim)

    :map helm-projectile-find-file-map
      ;; Ergo keys
      ("M-i" . helm-previous-line)
      ("M-k" . helm-next-line)
      ("M-j" . helm-previous-source)
      ("M-l" . helm-next-source)
      ("M-I" . helm-previous-page)
      ("M-K" . helm-next-page)
      ([tab] . nil)
   ) ;end of :bind
  ) ; end of use-package




