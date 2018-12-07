;; Helm interface based swoop (multi-occur search and edit)

(use-package helm-swoop
  ; Only use this if helm is present
  :requires helm
  ; get it from package.el
  :ensure t
  :after (
          helm
   ) ; after
  :commands (
             helm-swoop
             helm-swoop-back-to-last-point
             helm-swoop-map
             helm-multi-swoop-map
             helm-multi-swoop-buffers-map
    ) ; end :commands
  :init
  :config
    ; change how the window is split for helm-swoop
    (setq helm-swoop-split-direction 'split-window-horizontally)
 :bind (
    ;start a swoop search
    ("C-e" . helm-swoop)
    ("C-S-e" . helm-swoop-back-to-last-point)

    ;for some reason helm-swoop is overriding the tab command to be helm-swoop, restore it
    ([tab] . indent-for-tab-command)

    :map isearch-mode-map
     ;key combo to switch to swoop mode
     ("C-e" . helm-swoop-from-isearch)

    :map helm-swoop-map
      ;go onto multi-swoop mode
      ("C-e" . helm-multi-swoop-all-from-helm-swoop)
      ;Ergo keys
      ("M-i" . helm-previous-line)
      ("M-k" . helm-next-line)
      ("M-j" . helm-previous-source)
      ("M-l" . helm-next-source)
      ("M-I" . helm-previous-page)
      ("M-K" . helm-next-page)
      ([tab] . nil)

    :map helm-multi-swoop-map
      ;Ergo keys
      ("M-i" . helm-previous-line)
      ("M-k" . helm-next-line)
      ("M-j" . helm-previous-source)
      ("M-l" . helm-next-source)
      ("M-I" . helm-previous-page)
      ("M-K" . helm-next-page)
      ([tab] . nil)

    :map helm-multi-swoop-buffers-map
      ;Ergo keys
      ("M-i" . helm-previous-line)
      ("M-k" . helm-next-line)
      ("M-j" . helm-previous-source)
      ("M-l" . helm-next-source)
      ("M-I" . helm-previous-page)
      ("M-K" . helm-next-page)
      ([tab] . nil)
   ) ;end of :bind
  ) ; end of use-package




