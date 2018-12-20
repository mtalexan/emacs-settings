;; First file after the custom-settings and custom-faces
;; Should contain the basic settings and configuration only
;; Does not contain any new functions for modes or significant mode changes

;;(put 'upcase-region 'disabled nil)

(require 'frame)
; Set default font based on system type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (when (member "Consolas" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "Consolas-10"))
    (add-to-list 'default-frame-alist '(font . "Consolas-10"))))
 ((string-equal system-type "darwin") ; macOS
  (when (member "Menlo" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "Menlo"))
    (add-to-list 'default-frame-alist '(font . "Menlo"))))
 ((string-equal system-type "gnu/linux") ; linux
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10")))))

;;Load a file identification settings file that can be changed modularly
(let ((file "emacs.fileident"))
  (if (file-executable-p file) (load file)))

;; Garbage collection default is very low.  Large file/index operations are therefore terrible.
;; fix it by increasing the default garbage collection limit
(setq gc-cons-threshold 20000000)

;; Increase the large file warning so it doesn't halt loading when TAG files are more than 10MB
(setq large-file-warning-threshold 200000000) ;200MB file limit

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(require 'woman)
;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

(require 'reftex-index)
;; enable visual feedback on selections
(setq transient-mark-mode t)

(require 'frame)
;; default to better frame titles - used in diffs
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

(require 'diff)
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

(require 'scroll-bar)
;; Put the scrollbars on the right
(scroll-bar-mode (quote right))

;; always end a file with a newline
;(setq require-final-newline 'query)

(require 'subword)
;; Treat camelcase as a word boundary by default in these modes
(add-hook 'c-mode-common-hook
          (lambda () (subword-mode 1)))
(require 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda () (subword-mode 1)))
(require 'python)
(add-hook 'python-mode-hook
          (lambda () (subword-mode 1)))
