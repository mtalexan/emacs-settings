;; A quick-jump tool for going between windows

;; WARNING: Requires package "avy", but the dependency selection in MELPA doesn't work.
;;          "avy" must be manually installed instead.
(use-package ace-window
  :ensure t
  :commands (
    ace-window
    ) ; end :commands
  :after (
    avy
    ); after
  :init
    ;; Set the keybinding
    (define-key global-map (kbd "M-=") 'ace-window)
  :config

  ;; Set the initial list of shortcut keys used to label the windows.
  ;; Defaults to numbers.
  ;; This must NOT include the special keys used for actions on windows
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

  ;; Scope of offerings: global or frame. Default is global
  (setq aw-scope 'global)

  ;; Disable greying out the windows to highlight the hot keys
  ;(setq aw-background nil)

  ;; Always prompt for shortcuts even when there's only two windows.
  ;; By default there's no prompt if only 2 windows are present
  (setq aw-dispatch-always t)

  ;; Default quick window actions available.  Can be customized.
  (defvar aw-dispatch-alist
    '((?x aw-delete-window "Delete Window") ; Also C-u C-u ace-window
      (?m aw-swap-window "Swap Windows") ; Also C-u ace-window
      ;(?M aw-move-window "Move Window")
      ;(?j aw-switch-buffer-in-window "Select Buffer")
      (?n aw-flip-window) ; like other-window
      (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
      (?c aw-split-window-fair "Split Fair Window")
      (?v aw-split-window-vert "Split Horz Window")
      (?b aw-split-window-horz "Split Vert Window")
      (?o delete-other-windows "Delete Other Windows")
      (?? aw-show-dispatch-help))
    "List of actions for `aw-dispatch-default'.")
  ;; Default character during ace-window mode that just opens a new frame.  Default char is "z".
  (setq aw-make-frame-char ?z)

  ;; Display the ace window string in the minibuffer as well as the modeline
  (setq aw-minibuffer-flag t)

  ;; Don't present the current window as an option
  ;(setq aw-ignore-current t)

 :bind (
     ;; main key
     ;("M-=" . ace-window)
   ) ;end of :bind
  ) ; end of use-package




