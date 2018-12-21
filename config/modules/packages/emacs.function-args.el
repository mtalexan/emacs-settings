;; Tool intended to display function arguments as tool tips and support
;; overridden functions, but it ends up extending the built in CEDET (and
;; especially Semantic) to support C++ since they do a very poor job of
;; supporting it.

(use-package function-args
  :ensure t
  :commands (
      function-args-active-mode
      function-args-active-mode-map
      fa-active-enter
      fa-active-exit
      fa-active-end
      fa-mode-disable-check
      fa-active-jump
      fa-abort
      fa-show
      ) ; end :commands
  :after (
      ivy
      ) ;end :after
  :hook (
     (function-args-mode . fa-mode-disable-check)
   )
  :init
  :config
    ;; initial defaults
    (fa-config-default)

    ;; this line is necessary to be sure it's loaded before we try to adjust the map.  It's loaded indirectly by function-args
    (require 'ivy)

    ;; Function Args really should have a minor mode that activates on the
    ;; fa-show call since half of the available actions only apply after
    ;; an fa-show call and before an fa-abort
    (define-minor-mode function-args-active-mode
      "Minor mode that should be triggered in place of fa-show to keep related commands under a minor-mode keymap"
      :lighter " fa-active"
      :keymap (let ((map (make-sparse-keymap))) ;auto named function-args-active-mode-map
                (define-key map (kbd "M-n") 'fa-idx-cycle-down)
                (define-key map (kbd "M-p") 'fa-idx-cycle-up)
                (define-key map (kbd "M-:") 'fa-active-end) ;toggle the mode off, which aborts
                (define-key map (kbd "M-.") 'fa-active-jump)
                ;fa-jump-maybe is useless and inconsistent, don't map it
                map)
      :group function-args

      ;; activating does fa-show, deactivating does fa-abort  
      (if function-args-active-mode
          (fa-active-enter)
          (fa-active-exit)) 
      )
    (provide 'function-args-active-mode)


    (defun fa-active-enter ()
      (interactive)
      "Handlling for when the function-args-active-mode is enabled.  Does fa-show and pushes a mark."
      (fa-show)
      (push-mark))
    (provide 'fa-active-enter)

    (defun fa-active-exit ()
      (interactive)
      "Handlling for when the function-args-active-mode is enabled.  Does fa-show and pushes a mark."
      (fa-abort))
    (provide 'fa-active-exit)

    (defun fa-active-end ()
      (interactive)
      "Turns off the function-args-active-mode, which implicitly aborts"
      (function-args-active-mode 0))
    (provide 'fa-active-exit)

    (defun fa-mode-disable-check ()
      "For use in the function-args-mode-hook.  
       Checks to see if function-args-mode is being disabled and disables function-args-active-mode as well."
      (if function-args-mode
          nil
        (function-args-active-mode 0)))
    (provide 'fa-mode-disable-check)

    (defun fa-active-jump ()
      (interactive)
      "Handles the fa-jump call which needs to perform an fa-abort"
      (push-mark)
      (fa-jump)
      (fa-active-end) ;fa-abort gets ignored here for some reason, so do it explicitly next
      (fa-abort))
    (provide 'fa-active-jump)

    ;; parse include files too
    (setq moo-do-includes t)

    :bind (

      :map function-args-mode-map
        ;;key bindings weren't under a prefix map so clear them all
        ("M-o" . nil)
        ("M-i" . nil)
        ("M-n" . nil)
        ("M-h" . nil)
        ("M-u" . nil)
        ("M-j" . nil)
        ("C-M-j" . nil)
        ;; Now remap only the ones we want to something useable
        ("M-;" . moo-complete)
        ("M-:" . function-args-active-mode)
        ;; intentionally override the helm-semantic-or-imenu
        ("C-c C-s" . moo-jump-local)

      :map ivy-minibuffer-map
        ;; Ergo
        ("M-n" . ivy-next-line)
        ("M-k" . ivy-next-line)
        ("M-K" . ivy-scroll-up-command)
        ("M-p" . ivy-previous-line)
        ("M-i" . ivy-previous-line)
        ("M-I" . ivy-scroll-down-command)
        ("M-j" . ivy-beginning-of-buffer)
        ("M-l" . ivy-end-of-buffer)
     ) ; end :bind
  )

