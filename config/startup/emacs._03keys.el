;; Contains general key bindings, including rectangle mode
;; See other files for special mode bindings

;; General Key bindings
(require 'simple)
(define-key global-map [(meta g)] 'goto-line)
;(require 'window)
(define-key global-map [(meta -)] 'delete-window)
(define-key global-map [(meta ?1)] 'delete-other-windows)
(define-key global-map [(meta ?3)] 'split-window-horizontally)
(define-key global-map [(meta ?2)] 'split-window-vertically)
(define-key global-map [(meta ?0)] 'other-window)
(define-key global-map [(meta ?9)] 'other-frame)
(require 'compile)
(define-key global-map [(meta c)] 'compile)
(require 'grep)
(define-key global-map [(meta f)] 'rgrep)

;; redefine movement keys (rough copy of ergo movement with modifications)
;; permanently built-in commands
(define-key global-map [(meta j)] 'backward-char)
(define-key global-map [(meta l)] 'forward-char)
(require 'simple)
(define-key global-map [(meta i)] 'previous-line)
(define-key global-map [(meta k)] 'next-line)
(define-key global-map [(meta o)] 'move-end-of-line)
(define-key global-map [(meta u)] 'move-beginning-of-line)

;; permanently built-in commands
(define-key global-map [(meta I)] 'scroll-down)
(define-key global-map [(meta K)] 'scroll-up)
(define-key global-map [(meta J)] 'backward-word)
(define-key global-map [(meta L)] 'forward-word)
(define-key global-map [(meta O)] 'forward-sexp)
(define-key global-map [(meta U)] 'backward-sexp)

;; In no-window mode arrow keys, pgup, pgdn, home, end, etc are prefaced with "ESC O"
(defvar no-window-map)
(define-prefix-command 'no-window-map)
(define-key global-map (kbd "ESC O") 'no-window-map)
;; permanently built-in commands
(define-key no-window-map (kbd "<left>") 'backward-char)
(define-key no-window-map (kbd "<right>") 'forward-char)
(require 'simple)
(define-key no-window-map (kbd "<up>") 'previous-line)
(define-key no-window-map (kbd "<down>") 'next-line)
(define-key no-window-map (kbd "<end>") 'move-end-of-line)
(define-key no-window-map (kbd "<home>") 'move-beginning-of-line)

(define-key no-window-map (kbd "<pgup>") 'scroll-down)
(define-key no-window-map (kbd "C-<left>") 'backward-word)
(define-key no-window-map (kbd "<pgdn>") 'scroll-up)
(define-key no-window-map (kbd "C-<right>") 'forward-word)
;;M-O was used to move forward to the matching sexp, but no-window mode 
;;prefaces special keys with M-O so we map return to actually perform the jump
(define-key no-window-map (kbd "<RET>") 'forward-sexp)

;; Add another way to set the mark 
;; Now when moving without arrow keys, releasing meta isn't necessary to mark
(require 'simple)
(global-set-key (kbd "M-SPC") 'set-mark-command)

(require 'simple)
;;some useful mappings for deleting. Ignore M- on backspace
(global-set-key (kbd "M-<backspace>") 'backward-delete-char-untabify)
;;Do the best we can to delete the last word on C-backspace.  It adds it to the kill ring though,
;;there's no other option
(require 'simple)
(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
;;C-S-k does the same as the delete key
(global-set-key (kbd "C-S-k") 'delete-forward-char)

;; Rectangle commands mapped under M-r instead of C-x r
;; emacs 24.4 or later?
(require 'rect)
(when (or (> emacs-major-version 24) (and (= emacs-major-version 24) (>= emacs-minor-version 4)))
  ;;in 24.4 and later the mark type can be changed to be a rectangle as well
  (global-set-key [(meta r)] 'rectangle-mark-mode)
  (define-key rectangle-mark-mode-map [(k)] 'kill-rectangle)
  (define-key rectangle-mark-mode-map [(y)] 'yank-rectangle)
  (define-key rectangle-mark-mode-map [(control w)] 'copy-rectangle-as-kill)
  (define-key rectangle-mark-mode-map [(t)] 'string-rectangle)
  )
;;emacs prior to 24.4?
(when (or (< emacs-major-version 24) (and (= emacs-major-version 24) (< emacs-minor-version 4)))
  ;;prior to 24.4 we can do rectangle commands, but there isn't a mark mode for it
  (defvar rect-edit-map)
  (define-prefix-command 'rect-edit-map)
  (define-key global-map [(meta r)] 'rect-edit-map)
  (define-key rect-edit-map [(k)] 'kill-rectangle)
  (define-key rect-edit-map [(y)] 'yank-rectangle)
  (define-key rect-edit-map [(control w)] 'copy-rectangle-as-kill)
  (define-key rect-edit-map [(t)] 'string-rectangle)
  )

(require 'simple)
;; Minibuffer command history - only useful when already in the minibuffer
;; emacs 25.0 or later?
(when (>= emacs-major-version 25)
  ;;25.0 and later allow multiple line entries in the minibuffer, so allow navigation across the lines first
  (define-key minibuffer-local-map [(meta i)] 'previous-line-or-history-element)
  (define-key minibuffer-local-map [(meta k)] 'next-line-or-history-element)
  (define-key minibuffer-local-map (kbd "<up>") 'previous-line-or-history-element)
  (define-key minibuffer-local-map (kbd "<down>") 'next-line-or-history-element)
  )
;;emacs prior to 25.0?
(when (< emacs-major-version 25)
  (define-key minibuffer-local-map [(meta i)] 'previous-history-element)
  (define-key minibuffer-local-map [(meta k)] 'next-history-element)
  (define-key minibuffer-local-map (kbd "<up>") 'previous-history-element)
  (define-key minibuffer-local-map (kbd "<down>") 'next-history-element)
  )

;; scrolls without moving cursor-set-key (kbd "s-i") (lambda () (interactive) (scroll-down 1)))
;; Note that the "s" in this is the Super key.  Normally this is mapped to the Win key.  If running
;; in windows however, manual blocking of the pass thru must be done so the Win key NEVER goes to
;; Windows itself and will always be processed by emacs.  This is a problem if you're running in Windows
;; or on an X-forwarded session in Cygwin.
;(global-set-key (kbd "s-k") (lambda () (interactive) (scroll-up 1)))
;(global-set-key (kbd "s-i") (lambda () (interactive) (scroll-down 1)))
;(global-set-key (kbd "s-j") (lambda () (interactive) (scroll-right 1)))
;(global-set-key (kbd "s-l") (lambda () (interactive) (scroll-left 1)))
;
;(global-set-key (kbd "C-s-i") (lambda () (interactive) (scroll-other-window-down 1)))
;(global-set-key (kbd "C-s-k") (lambda () (interactive) (scroll-other-window 1)))
;(global-set-key (kbd "C-s-j") (lambda () (interactive) (scroll-other-window-right 1)))
;(global-set-key (kbd "C-s-l") (lambda () (interactive) (scroll-other-window-left 1)))

;(require 'simple)
;; Run shell selected region in shell
;; "r" to interactive means the marked region needs to be passed as well, b & e are the mark points, and "sh"
;; is the command to run (basically just pass the contents to be run in a regular sh shell.
;(global-set-key (kbd "C-|") (lambda (&optional b e p) (interactive "r") (shell-command-on-region b e "bash" p)))

;; Run shell selected region in shell
;; "r" to interactive means the marked region needs to be passed as well, b & e are the mark points, and "sh"
;; is the command to run (basically just pass the contents to be run in a regular sh shell.
;(global-set-key (kbd "C-|") (lambda (&optional b e p) (interactive "r") (shell-command-on-region b e "bash" p)))
