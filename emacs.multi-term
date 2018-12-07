;; Opens a terminal inside emacs with some of the emacs keybindings

(use-package multi-term
  ; get it from package.el
  :ensure t
  :commands (
             multi-term
    )
  :hook (
         ;handle ansi colors in the shell and term
         (term-mode . ansi-color-for-comint-mode-on)
         ; Turn off the scrollbars by default when starting multi-term session
         ; Put the scrollbars on the right
         (term-mode . (lambda () (scroll-bar-mode 0)))
    )
  :init
  :config
    ; Use bash as the terminal
    (setq multi-term-program "/bin/bash")
    ; fill the visible area before scrolling
    (setq multi-term-scroll-show-maximum-output t)
    ; Scroll on output
    (setq multi-term-scroll-to-bottom-on-output t)
    ;Don't limit the terminal buffer lines
    (setq term-buffer-maximum-size 0)
    ;Turn off the recoloring for the terminal so it keeps the default emacs colors
    (setq term-default-bg-color nil)
    (setq term-default-fg-color nil)
    :bind (
       ; main entry key
       ("C-z" . multi-term)
     )
  )
