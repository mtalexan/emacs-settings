;; .emacs

;; Don't edit this by hand, instead use the Options->Customize Emacs
;; from the menubar and edit the options from the customization groups.
;; Saving the changes there actually saves them here.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;Load a coding style settings file that can be changed modularly
;;  This should be the only file like this before the custom-set-variables.
;;  We want it here so different settings can be tested through the customize-group
;;  and won't be overridden by these settings.
(let ((file "~/.emacs.d/emacs.codingstyle"))
  (if (file-executable-p file) (load-file file)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-coding-alist
   (quote
    (("\\.\\(arc\\|zip\\|lzh\\|lha\\|zoo\\|[jew]ar\\|xpi\\|rar\\|ARC\\|ZIP\\|LZH\\|LHA\\|ZOO\\|[JEW]AR\\|XPI\\|RAR\\)\\'" . no-conversion-multibyte)
     ("\\.\\(exe\\|EXE\\)\\'" . no-conversion)
     ("\\.\\(sx[dmicw]\\|odt\\|tar\\|tgz\\)\\'" . no-conversion)
     ("\\.\\(gz\\|Z\\|bz\\|bz2\\|gpg\\)\\'" . no-conversion)
     ("\\.\\(jpe?g\\|png\\|gif\\|tiff?\\|p[bpgn]m\\)\\'" . no-conversion)
     ("\\.pdf\\'" . no-conversion))))
 '(auto-coding-regexp-alist
   (quote
    (("\\`BABYL OPTIONS:[ 	]*-\\*-[ 	]*rmail[ 	]*-\\*-" . no-conversion)
     ("\\`\376\377" . utf-16be-with-signature)
     ("\\`\377\376" . utf-16le-with-signature)
     ("\\`\357\273\277" . utf-8-with-signature))))
 '(bs-must-always-show-regexp "[~]*[^*#].*")
 '(c-basic-offset 4)
 '(c-default-style
   (quote
    ((c-mode . "")
     (c++-mode . "")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(c-doc-comment-style
   (quote
    ((c-mode . gtkdoc)
     (c++-mode . gtkdoc)
     (java-mode . javadoc)
     (pike-mode . autodoc))))
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(delete-active-region (quote kill))
 '(ediff-make-buffers-readonly-at-startup nil)
 '(ediff-prefer-iconified-control-frame t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-temp-file-prefix "tmp_diff_")
 '(ediff-use-long-help-message t)
 '(ediff-version-control-package (quote vc))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(kill-do-not-save-duplicates t)
 '(kill-read-only-ok t)
 '(kill-whole-line nil)
 '(package-selected-packages
   (quote
    (lua-mode projectile helm color-theme-approximate egg function-args ggtags xcscope smart-mode-line smooth-scrolling multi-term helm-projectile elscreen company)))
 '(save-interprogram-paste-before-kill t)
 '(scroll-bar-mode (quote right))
 '(select-enable-primary t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(standard-indent 4)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(winner-mode t)
 '(yank-pop-change-selection t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "tan" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(ediff-current-diff-Ancestor ((t (:background "#553333"))))
 '(ediff-current-diff-B ((t (:background "#553333"))))
 '(ediff-current-diff-C ((t (:background "#553333"))))
 '(ediff-even-diff-A ((t (:background "tomato4"))))
 '(ediff-even-diff-Ancestor ((t (:background "tomato4"))))
 '(ediff-even-diff-B ((t (:background "tomato4"))))
 '(ediff-even-diff-C ((t (:background "tomato4"))))
 '(ediff-fine-diff-Ancestor ((t (:background "#aa2222"))))
 '(ediff-fine-diff-B ((t (:background "#aa2222"))))
 '(ediff-fine-diff-C ((t (:background "#aa2222"))))
 '(ediff-odd-diff-A ((t (:background "tomato4"))))
 '(ediff-odd-diff-Ancestor ((t (:background "tomato4"))))
 '(ediff-odd-diff-B ((t (:background "tomato4"))))
 '(ediff-odd-diff-C ((t (:background "tomato4")))))

(put 'upcase-region 'disabled nil)

;;Load a file identification settings file that can be changed modularly
(let ((file "~/.emacs.d/emacs.fileident"))
  (if (file-executable-p file) (load-file file)))


;; Garbage collection default is very low.  Large file/index operations are therefore terrible.
;; fix it by increasing the default garbage collection limit
(setq gc-cons-threshold 20000000)

;; Increase the large file warning so it doesn't halt loading when TAG files are more than 10MB
(setq large-file-warning-threshold 200000000) ;200MB file limit

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles - used in diffs
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
;(setq diff-switches "-u")
(setq diff-switches "--normal")

;; set the scroll speed to 1 line jump (smooth)
(setq scroll-step 1)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; do not make backup files
;(setq make-backup-files nil)
(setq backup-inhibited t)

;; Put the scrollbars on the right
(scroll-bar-mode (quote right))

;; always end a file with a newline
;(setq require-final-newline 'query)

;; General Key bindings
(define-key global-map [(meta g)] 'goto-line)
(define-key global-map [(meta -)] 'delete-window)
(define-key global-map [(meta ?1)] 'delete-other-windows)
(define-key global-map [(meta ?3)] 'split-window-horizontally)
(define-key global-map [(meta ?2)] 'split-window-vertically)
(define-key global-map [(meta ?0)] 'other-window)
(define-key global-map [(meta ?9)] 'other-frame)
(define-key global-map [(meta c)] 'compile)
(define-key global-map [(meta f)] 'rgrep)

;; redefine movement keys (rough copy of ergo movement with modifications)
(define-key global-map [(meta i)] 'previous-line)
(define-key global-map [(meta j)] 'backward-char)
(define-key global-map [(meta k)] 'next-line)
(define-key global-map [(meta l)] 'forward-char)
(define-key global-map [(meta o)] 'move-end-of-line)
(define-key global-map [(meta u)] 'move-beginning-of-line)

(define-key global-map [(meta I)] 'scroll-down)
(define-key global-map [(meta J)] 'backward-word)
(define-key global-map [(meta K)] 'scroll-up)
(define-key global-map [(meta L)] 'forward-word)
(define-key global-map [(meta O)] 'forward-sexp)
(define-key global-map [(meta U)] 'backward-sexp)

;; Set subword-mode to trigger in all C/C++ mode buffers so camelcase is treated as a word boundary
(add-hook 'c-mode-common-hook
          (lambda () (subword-mode 1)))

;; In no-window mode arrow keys, pgup, pgdn, home, end, etc are prefaced with "ESC O"
(define-prefix-command 'no-window-map)
(define-key global-map (kbd "ESC O") 'no-window-map)
(define-key no-window-map (kbd "<up>") 'previous-line)
(define-key no-window-map (kbd "<left>") 'backward-char)
(define-key no-window-map (kbd "<down>") 'next-line)
(define-key no-window-map (kbd "<right>") 'forward-char)
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
(global-set-key (kbd "M-SPC") 'set-mark-command)

;;some useful mappings for deleting. Ignore M- on backspace
(global-set-key (kbd "M-<backspace>") 'backward-delete-char-untabify)
;;Do the best we can do delete the last word on C-backspace.  It adds it to the kill ring though,
;;there's no other option
(global-set-key (kbd "C-<backspace>") 'backward-kill-word)
;;C-S-k does the same as the delete key
(global-set-key (kbd "C-S-k") 'delete-forward-char)

;; Rectangle commands mapped under M-r instead of C-x r
; emacs 24.4 or later?
(when (or (> emacs-major-version 24) (and (= emacs-major-version 24) (>= emacs-minor-version 4)))
  (require 'rect)
  ;in 24.4 and later the mark type can be changed to be a rectangle as well
  (global-set-key [(meta r)] 'rectangle-mark-mode)
  (define-key rectangle-mark-mode-map [(k)] 'kill-rectangle)
  (define-key rectangle-mark-mode-map [(y)] 'yank-rectangle)
  (define-key rectangle-mark-mode-map [(control w)] 'copy-rectangle-as-kill)
  (define-key rectangle-mark-mode-map [(t)] 'string-rectangle)
  )
;emacs prior to 24.4?
(when (or (< emacs-major-version 24) (and (= emacs-major-version 24) (< emacs-minor-version 4)))
  ;prior to 24.4 we can do rectangle commands, but there isn't a mark mode for it
  (define-prefix-command 'rect-edit-map)
  (define-key global-map [(meta r)] 'rect-edit-map)
  (define-key rect-edit-map [(k)] 'kill-rectangle)
  (define-key rect-edit-map [(y)] 'yank-rectangle)
  (define-key rect-edit-map [(control w)] 'copy-rectangle-as-kill)
  (define-key rect-edit-map [(t)] 'string-rectangle)
  )

;; Minibuffer command history - only useful when already in the minibuffer
; emacs 25.0 or later?
(when (>= emacs-major-version 25)
  ;25.0 and later allow multiple line entries in the minibuffer, so allow navigation across the lines first
  (define-key minibuffer-local-map [(meta i)] 'previous-line-or-history-element)
  (define-key minibuffer-local-map [(meta k)] 'next-line-or-history-element)
  (define-key minibuffer-local-map (kbd "<up>") 'previous-line-or-history-element)
  (define-key minibuffer-local-map (kbd "<down>") 'next-line-or-history-element)
  )

;emacs prior to 25.0?
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

;; ISearch modifications
;redefine the keybinding that normally copies the rest of the word forward from the point to copy the whole
;of the current symbol and search forward with that
(define-key isearch-mode-map (kbd "C-w") 'isearch-forward-symbol-at-point)

;; Run shell selected region in shell
;; "r" to interactive means the marked region needs to be passed as well, b & e are the mark points, and "sh"
;; is the command to run (basically just pass the contents to be run in a regular sh shell.
;(global-set-key (kbd "C-|") (lambda (&optional b e p) (interactive "r") (shell-command-on-region b e "sh" p)))

;; Command-line Diff
;; Usage: emacs -diff file1 file2
(defun command-line-diff (switch)
      (let ((file1 (pop command-line-args-left))
            (file2 (pop command-line-args-left)))        
        (ediff-files file1 file2)))
    
(add-to-list 'command-switch-alist '("diff" . command-line-diff))
(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Cursor Color Fix
; For some reason the cursor color only seems to be set when the frame a
; frame is initially created, rather than whenever it gains focus.  This
; means changing between different colored frames that require light-vs-dark
; cursors because of their background colors is screwed.  Notably, with auto
; complete enabled it creates a new mini-frame with a light background and
; sets the cursor color to a black.  The result is that when the auto complete
; closes it will return to the dark background frame you're working in with the
; cursor still set to black and therefore invisible

(defun frame-bg (frame)
  "Custom behaviours for new frames."
  (with-selected-frame frame
    (set-cursor-color "#ffffff")
    ))
(frame-bg (selected-frame))
(add-hook 'after-make-frame-functions 'frame-bg)

;; WINNER MODE
;; This is already included in default emacs as of 20.  It allows window configuration changes
;; to have an undo/redo history.  It's useful if pulling up cscope results when window already
;; then returning to the splits that were already there

(setq winner-mode t)
; defaults are C-c left and C-c right, just ad C-j and C-l as right and left
(global-set-key (kbd "C-c C-j") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)

;; Lock Window mode
;; A common problem is maintaining splits when tasks generate windows automatically.
;; In order to keep splits from being stolen, and force a new one to be created
;; instead, splits that shouldn't be stolen should be marked as dedicated.

; Toggle window dedication function
(defun toggle-window-dedicated ()
"Toggle whether the current active window is dedicated or not"
(interactive)
(message 
 (if (let (window (get-buffer-window (current-buffer)))
       (set-window-dedicated-p window 
        (not (window-dedicated-p window))))
    "Window '%s' is dedicated"
    "Window '%s' is normal")
 (current-buffer)))

; assign a key to the function
;(global-set-key [Scroll_Lock] 'toggle-window-dedicated)

;; Window Split Direction Preference
;; To set how windows automatically get split when creating a new buffer, there are
;; two parts.  The first is to customize when we decide we shouldn't split in a given
;; direction.  The function split-window-sensibly is normally the option setting for the
;; split-window-preferred-function setting which is called when this determination needs
;; to be made.  The split-window-sensibly function looks at the split-height-threshold
;; value, and if it's not nil and the window has at least that many lines in it, it will
;; split vertically (top-bottom).  If the window doesn't have enough lines in it, it will
;; check split-width-threshold to see if the window has sufficient columns in it.  If it
;; does, it will split horizontally (left-right).  If both aren't met, it will steal an
;; open window and use that instead.  If we want to prefer horizontal (left-right) splitting
;; over vertical (top-bottom) splitting, we need an entirely new function.  Note that if either
;; of these is set to nil, that type of split will never automatically be created. 
;(setq split-height-threshold 0)
;(setq split-width-threshold 0)

(when (>= emacs-major-version 24)

  ; split-window-sensibly duplicated but with horizontal over vertical preference instead.
  (defun my-split-window-sensibly (&optional window)
    (let ((window (or window (selected-window))))
      (or (and (window-splittable-p window t)
               ;; Split window horizontally.
               (with-selected-window window
                 (split-window-right)))
          (and (window-splittable-p window)
               ;; Split window vertically.
               (with-selected-window window
                 (split-window-below)))
          (and (eq window (frame-root-window (window-frame window)))
               (not (window-minibuffer-p window))
               ;; If WINDOW is the only window on its frame and is not the
               ;; minibuffer window, try to split it horizontally disregarding
               ;; the value of `split-width-threshold'.
               (let ((split-width-threshold 0))
                 (when (window-splittable-p window t)
                   (with-selected-window window
                     (split-window-right))))))))

  ;set our function that prefers horizontal over vertical splitting as the one used for automatic splitting
  (setq split-window-preferred-function 'my-split-window-sensibly)
  )

;; UNPOP MARK
;; The C-u C-SPC command does a pop-mark and will go back to the last mark.  This is handy, but it would
;; be nice to have a way of moving forward through the list as well
;; Marks are set for selection, but are set other times too.  Double setting the mark will leave the
;; mark but leave off the transient selection mode used to select and modify text.  The marks can then
;; be navigated
(defun unpop-to-mark-command ()
  "Unpop off mark ring. Does nothing if mark ring is empty."
  (interactive)
      (when mark-ring
        (setq mark-ring (cons (copy-marker (mark-marker)) mark-ring))
        (set-marker (mark-marker) (car (last mark-ring)) (current-buffer))
        (when (null (mark t)) (ding))
        (setq mark-ring (nbutlast mark-ring))
        (goto-char (marker-position (car (last mark-ring))))))

(global-set-key (kbd "C-<") 'pop-to-mark-command)
(global-set-key (kbd "C->") 'unpop-to-mark-command)

;; Modify some of the file type identification
(add-to-list 'auto-mode-alist '("Makefile" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("GNUMakefile" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.mk\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.defs\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.class\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '(".?Config.*" . makefile-gmake-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modules/Packages should be added here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Do this first, since the rest of the package loading should be making use of it
(load-file "~/.emacs.d/emacs.use-package")

; This is almost deprecated, so conditionaly include it to make it easier to remove later
(let ((file "~/.emacs.d/emacs.cl-lib"))
  (if (file-executable-p file) (load-file file)))

(load-file "~/.emacs.d/emacs.package")

(load-file "~/.emacs.d/emacs.linum")
(load-file "~/.emacs.d/emacs.smoothscrolling")
(load-file "~/.emacs.d/emacs.visible-mark")

(load-file "~/.emacs.d/emacs.rich-minority")
(load-file "~/.emacs.d/emacs.smart-mode-line")

;multi-term doesn't show output correctly
;(load-file "~/.emacs.d/emacs.multi-term")

(load-file "~/.emacs.d/emacs.elscreen")

(load-file "~/.emacs.d/emacs.helm")
(load-file "~/.emacs.d/emacs.projectile")
(load-file "~/.emacs.d/emacs.helm-projectile")

(load-file "~/.emacs.d/emacs.company")

(load-file "~/.emacs.d/emacs.xcscope")

(load-file "~/.emacs.d/emacs.semantic")
(load-file "~/.emacs.d/emacs.function-args")

(load-file "~/.emacs.d/emacs.ggtags")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local emacs script is the only thing that should be loaded here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Things that can be considered for the emacs.local script
;(load-file "~/.emacs.d/emacs.clearcase")
;(load-file "~/.emacs.d/emacs.sr-speedbar")
;(load-file "~/.emacs.d/emacs.egg")

;; This should always be last.  It configures for the specific system and isn't tracked, so it should be
;; able to optionally override everything else in this file
(let ((file "~/.emacs.d/emacs.local"))
  (if (file-executable-p file) (load-file file)))
