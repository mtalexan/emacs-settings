;; Allows saving of multiple window setups to "screens" with quick jump capabilities to 0-9.

; This package is included in Emacs 24.x by default
(use-package elscreen
  ; get it from package.el
  :ensure t
  :init
    ;always load this
    (require 'elscreen)
  :config

    ;set the prefix key as a keybinding value
    (setq elscreen-prefix-key (kbd "C-t"))
    ; Disable elscreen being allowed to process the command line arguments
    (setq elscreen-startup-command-line-processing nil)
    ;force notifications on the tabs to work correctly
    (elscreen-notify-screen-modification 'force)

    ;disable tabs since they conflict with semantic notifications. Can always be displayed with helm-elscreen
    (setq elscreen-display-tab nil)
    (setq elscreen-tab-display-control nil)
    (setq elscreen-tab-display-kill-screen nil)

    ;show the screen number in the status line
    (setq elscreen-display-screen-number t)

    ;this MUST be last
    (elscreen-start)

    ; Regardless of other settings, this must always occur to hide tabs when we go into a terminal
    (add-hook 'term-mode-hook (lambda () (setq elscreen-display-tab nil) (elscreen-notify-screen-modification 'force)))

  :bind (
    :map elscreen-map
      ("c" . elscreen-clone)
      ("C-t" . elscreen-toggle)
      ("a" . elscreen-screen-nickname)
      ("b" . elscreen-display-screen-name-list)
    ) ; end :bind
  )

