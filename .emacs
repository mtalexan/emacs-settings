;; .emacs

;; Don't edit this by hand, instead use the Options->Customize Emacs
;; from the menubar and edit the options from the customization groups.
;; Saving the changes there actually saves them here.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-coding-alist
   (quote
    (("SConscript[^/]+\\'" . python-mode)
     ("\\.\\(arc\\|zip\\|lzh\\|lha\\|zoo\\|[jew]ar\\|xpi\\|rar\\|ARC\\|ZIP\\|LZH\\|LHA\\|ZOO\\|[JEW]AR\\|XPI\\|RAR\\)\\'" . no-conversion-multibyte)
     ("\\.\\(exe\\|EXE\\)\\'" . no-conversion)
     ("\\.\\(sx[dmicw]\\|odt\\|tar\\|tgz\\)\\'" . no-conversion)
     ("\\.\\(gz\\|Z\\|bz\\|bz2\\|gpg\\)\\'" . no-conversion)
     ("\\.\\(jpe?g\\|png\\|gif\\|tiff?\\|p[bpgn]m\\)\\'" . no-conversion)
     ("\\.pdf\\'" . no-conversion)
     ("/#[^/]+#\\'" . emacs-mule))))
 '(auto-coding-regexp-alist
   (quote
    (("\\`BABYL OPTIONS:[ 	]*-\\*-[ 	]*rmail[ 	]*-\\*-" . no-conversion)
     ("\\`\376\377" . utf-16be-with-signature)
     ("\\`\377\376" . utf-16le-with-signature)
     ("\\`\357\273\277" . utf-8-with-signature)
     ("\\`;ELC   " . emacs-mule))))
 '(backup-directory-alist (quote ((".*" . "~/emacs.d/temp"))))
 '(bs-must-always-show-regexp "[~]*[^*#].*")
 '(c++-mode-hook (quote (linum-mode)))
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
 '(c-mode-hook (quote (linum-mode)))
 '(c-offsets-alist
   (quote
    ((inline-open . 0)
     (statement-case-open . +)
     (substatement-open . 0)
     (substatement-label . 0)
     (case-label . +)
     (access-label . -)
     (label . 1)
     (cpp-macro . -)
     (innamespace . 0))))
 '(column-number-mode t)
 '(company-abort-manual-when-too-short t)
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-auto-complete-chars (quote ignore))
 '(company-backends
   (quote
    ((company-gtags company-dabbrev-code company-keywords company-files))))
 '(company-dabbrev-code-everywhere t)
 '(company-dabbrev-code-modes
   (quote
    (prog-mode batch-file-mode python-mode c++-mode c-mode)))
 '(company-dabbrev-code-other-buffers t)
 '(company-frontends
   (quote
    (company-pseudo-tooltip-frontend company-echo-metadata-frontend company-preview-frontend)))
 '(company-global-modes t)
 '(company-gtags-insert-arguments t)
 '(company-gtags-modes (quote (prog-mode c++-mode c-mode)))
 '(company-idle-delay 0.2)
 '(company-selection-wrap-around t)
 '(company-transformers (quote (company-sort-by-backend-importance)))
 '(completions-format (quote vertical))
 '(cscope-index-recursively nil)
 '(cscope-max-cscope-buffer-size 1000000000)
 '(cscope-option-do-not-update-database t)
 '(cscope-option-kernel-mode t)
 '(cscope-option-use-inverted-index t)
 '(custom-safe-themes
   (quote
    ("f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(delete-active-region (quote kill))
 '(dired-dwim-target t)
 '(dired-isearch-filenames (quote dwim))
 '(edebug-sit-for-seconds 1)
 '(ediff-make-buffers-readonly-at-startup nil)
 '(ediff-prefer-iconified-control-frame t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-temp-file-prefix "tmp_diff_")
 '(ediff-use-long-help-message t)
 '(ediff-version-control-package (quote vc))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(egg-cmd-select-special-buffer t)
 '(egg-commit-file-select-mark 9654)
 '(egg-enable-tooltip t)
 '(egg-git-diff-file-options-alist
   (quote
    ((c-mode "--patience")
     (emacs-lisp-mode "--patience" "--ignore-all-space")
     (text-mode "--histogram")
     (makefile-mode "--patience"))))
 '(egg-log-buffer-marks
   "\342\234\224\342\234\216\342\226\274\342\227\217\342\232\222")
 '(egg-log-graph-chars
   "\342\227\217\342\224\202\342\224\200\342\225\261\342\225\262")
 '(egg-max-reflogs 30)
 '(egg-mode-key-prefix "C-x g")
 '(egg-refresh-index-in-backround t)
 '(egg-show-key-help-in-buffers (quote (:status :log :diff :commit :query :stash)))
 '(egg-status-buffer-sections (quote (repo staged unstaged untracked)))
 '(elscreen-display-screen-number t)
 '(elscreen-display-tab nil)
 '(elscreen-prefix-key "")
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen nil)
 '(ggtags-executable-directory "~/local/bin/")
 '(ggtags-oversize-limit 104857600)
 '(ggtags-sort-by-nearness t)
 '(ggtags-use-idutils t)
 '(ggtags-use-project-gtagsconf nil)
 '(git-gutter+-window-width 1)
 '(git-gutter-fr+-side (quote right-fringe))
 '(global-company-mode t)
 '(global-git-gutter+-mode t)
 '(global-linum-mode t)
 '(global-semantic-decoration-mode nil)
 '(global-semantic-highlight-edits-mode nil)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-breadcrumbs-mode t nil (semantic/idle))
 '(global-semantic-idle-completions-mode nil nil (semantic/idle))
 '(global-semantic-idle-local-symbol-highlight-mode nil nil (semantic/idle))
 '(global-semantic-idle-summary-mode nil)
 '(global-semantic-mru-bookmark-mode t)
 '(global-semantic-show-parser-state-mode nil)
 '(global-semantic-show-unmatched-syntax-mode nil)
 '(global-semantic-stickyfunc-mode t)
 '(global-semanticdb-minor-mode nil)
 '(global-visible-mark-mode t)
 '(helm-autoresize-mode t)
 '(helm-buffer-max-length nil)
 '(helm-gtags-auto-update nil)
 '(helm-gtags-cache-select-result nil)
 '(helm-gtags-display-style (quote detail))
 '(helm-gtags-fuzzy-match t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-prefix-key "\302\207")
 '(helm-gtags-preselect t)
 '(helm-gtags-suggested-key-mapping t)
 '(helm-gtags-use-input-at-cursor t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(kill-do-not-save-duplicates t)
 '(kill-read-only-ok t)
 '(kill-whole-line nil)
 '(linum-eager nil)
 '(moo-do-includes t)
 '(save-interprogram-paste-before-kill t)
 '(scroll-bar-mode (quote right))
 '(select-enable-primary t)
 '(semantic-c-dependency-system-include-path (quote ("/usr/include")))
 '(semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-tooltip))
 '(semantic-complete-inline-analyzer-idle-displayor-class (quote semantic-displayor-tooltip))
 '(semantic-completion-displayor-format-tag-function (quote semantic-format-tag-prototype))
 '(semantic-decoration-styles
   (quote
    (("semantic-decoration-on-includes")
     ("semantic-decoration-on-includes")
     ("semantic-tag-boundary" . t)
     ("semantic-decoration-on-protected-members")
     ("semantic-decoration-on-private-members"))))
 '(semantic-default-submodes
   (quote
    (global-semantic-highlight-func-mode global-semantic-stickyfunc-mode global-semantic-idle-scheduler-mode)))
 '(semantic-idle-breadcrumbs-display-function (quote semantic-idle-breadcrumbs--display-in-header-line))
 '(semantic-idle-scheduler-work-idle-time 30)
 '(semantic-idle-work-parse-neighboring-files-flag nil)
 '(semantic-idle-work-update-headers-flag t)
 '(semantic-imenu-auto-rebuild-directory-indexes t)
 '(semantic-imenu-index-directory t)
 '(semantic-imenu-sort-bucket-function (quote semantic-sort-tags-by-name-increasing-ci))
 '(semantic-imenu-summary-function (quote semantic-format-tag-prototype))
 '(semantic-mode t)
 '(semantic-stickyfunc-show-only-functions-p t)
 '(semantic-symref-auto-expand-results nil)
 '(semantic-update-mode-line nil nil (semantic/util-modes))
 '(semantic-which-function-use-color t)
 '(semanticdb-default-save-directory "(projectile-project-root)")
 '(semanticdb-ebrowse-file-match "\\.\\(hh?\\|HH?\\|hpp\\)")
 '(semanticdb-find-default-throttle
   (quote
    (local project unloaded system recursive omniscience)))
 '(semanticdb-persistent-path (quote (project)))
 '(semanticdb-project-roots (quote ("~/modular" "~/rrsdk")))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(sml/line-number-format "%4l")
 '(sml/mode-width (quote right))
 '(sml/position-percentage-format "%p")
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(sml/replacer-regexp-list
   (quote
    (("^~/org" ":Org:")
     ("^~/\\.emacs\\.d/" ":ED:")
     ("^/sudo:.*:" ":SU:")
     ("^~/Documents/" ":Doc:")
     ("^~/Dropbox/" ":DB:")
     ("^:\\([^:]*\\):Documento?s/" ":\\1/Doc:")
     ("^~/[Gg]it/" ":Git:")
     ("^~/[Gg]it[Hh]ub/" ":Git:")
     ("^~/[Gg]it\\([Hh]ub\\|\\)-?[Pp]rojects/" ":Git:")
     ("^~/modular_code_repos/\\(.*\\)/modular/" ":\\1:")
     ("^~/rrsdk_code_repos/\\(.*\\)/rrsdk/ksi/" ":\\1:"))))
 '(sml/theme (quote respectful))
 '(sml/vc-mode-show-backend nil)
 '(speedbar-show-unknown-files t)
 '(standard-indent 4)
 '(tags-add-tables t)
 '(tags-apropos-verbose t)
 '(tags-case-fold-search nil)
 '(tags-revert-without-query t)
 '(tags-table-list (quote ("~/emacs_tags/modular" "~/emacs_tags/OR1BusDev")))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-mark-faces (quote (visible-mark-forward-face2)))
 '(visible-mark-forward-faces (quote (visible-mark-forward-face2)))
 '(visible-mark-forward-max 5)
 '(visible-mark-inhibit-trailing-overlay t)
 '(visible-mark-max 5)
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
 '(ediff-odd-diff-C ((t (:background "tomato4"))))
 '(git-gutter-fr+-added ((t (:inherit git-gutter+-added))))
 '(git-gutter-fr+-deleted ((t (:inherit git-gutter+-deleted))))
 '(git-gutter-fr+-modified ((t (:inherit git-gutter+-modified))))
 '(semantic-highlight-func-current-tag-face ((t (:background "dark green"))))
 '(sml/folder ((t (:inherit sml/global :background "grey22" :foreground "forest green" :weight normal))))
 '(sml/minor-modes ((t (:foreground "dark goldenrod"))))
 '(sml/modes ((t (:inherit sml/global :background "grey40" :foreground "olive drab"))))
 '(visible-mark-face1 ((t (:box (:line-width 1 :color "light salmon")))))
 '(visible-mark-face2 ((t (:box (:line-width 1 :color "light goldenrod")))))
 '(visible-mark-forward-face1 ((t (:box (:line-width 1 :color "pale green")))))
 '(visible-mark-forward-face2 ((t (:box (:line-width 1 :color "grey40")))) t))

(put 'upcase-region 'disabled nil)

;; Garbage collection default is very low.  Large file/index operations are therefore terrible.
;; fix it by increasing the default garbage collection limit
(setq gc-cons-threshold 20000000)

;; Cl-lib is a forward compatibility package to support Emacs 24.x features on 23.x
(when (< emacs-major-version 24)
  (add-to-list 'load-path "~/.emacs.d/cl-lib/")
  (require 'cl-lib)
  )

;; Package.el
;; Used for package management against different repos.
;; Already included in 24, and repos allowed are different
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(when (< emacs-major-version 24)
  (load-file "~/.emacs.d/package.el")
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  )

;; Increase the large file warning so it doesn't halt loading when TAG files are more than 10MB
(setq large-file-warning-threshold 200000000) ;200MB file limit

;; Allow for random extensions on files containing the word "Makefile"
(setq auto-mode-alist (cons '("Makefile" . makefile-mode) auto-mode-alist))

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

;; HELP+
;; Expanded help capabilities
(require 'help-mode+)
(require 'help-fns+)

;; Smooth Scroll
;; Keeps scrolling smooth even when emacs is too slow to keep up (normally jumps then)
(load-file "~/.emacs.d/smooth-scrolling.el")
(require 'smooth-scrolling)

;; ETAGS
;; load the etags init
(load-file "~/.emacs.d/init-etags.el")
(require 'init-etags)

;; ELSCREEN
;; Allows saving of multiple window setups to "screens" 
;; with quick jump capabilities to 0-9.  
;; See key prefix below

;; load the elscreen plugin
;(load-file "~/.emacs.d/elscreen.el")
;(load "elscreen" "ElScreen" t)
(require 'elscreen)

; turn off the broken elscreen command-line processing
(setq elscreen-startup-command-line-processing nil)

; disable tabs since they conflict with semantic notifications. Can always display list with helm-elscreen
;(setq elscreen-display-tab nil)
;force notifications so the tabs work correctly
(elscreen-notify-screen-modification 'force)

; modify the key prefix for elscreen commands
;(elscreen-prefix-key "\C-t") ;this doesn't work, use customize-group with C-q to insert raw character sequence

; remap some elscreen keys
(define-key elscreen-map (kbd "c") 'elscreen-clone)
(define-key elscreen-map (kbd "C-t") 'elscreen-toggle)
(define-key elscreen-map (kbd "a") 'elscreen-screen-nickname)
(define-key elscreen-map (kbd "C-b") 'helm-elscreen)
(define-key elscreen-map (kbd "b") 'elscreen-display-screen-name-list)

; must do this last
(elscreen-start)

;; GREP-BUFFERS
;; Greps open buffers associated with files
;; M-x grep-buffers 
;; load the grep-buffers plugin
(load-file "~/.emacs.d/grep-buffers.el")

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

;; ONELINER
;; Opens the terminal inside Emacs and allows piping to and from
;; automatically generated temp files by not specifying anything 
;; (use default) or a special command before/after pipe.  To work
;; the system variable TMPDIR needs to be set to a folder to store
;; temporary files in (usually in home dir)
;; C-x C-z

;; load the oneliner plugin
;(load-file "~/.emacs.d/oneliner.el")
;(require 'oneliner)

; oneliner key command
;(define-key global-map [(control x) (control z)] 'oneliner)

;; MULTI-TERM
;; Opens a terminal inside emacs with some of the emacs key bindings

;; load the multi-term plugin
(load-file "~/.emacs.d/multi-term.el")
(require 'multi-term)

(define-key global-map [(control z)] 'multi-term)

; Use bash as the terminal
(setq multi-term-program "/bin/bash")
; fill the visible area before scrolling
(setq multi-term-scroll-show-maximum-output t)
; Scroll on output
(setq multi-term-scroll-to-bottom-on-output t)
;Don't limit the terminal buffer lines
(setq term-buffer-maximum-size 0)

;handle ansi colors in the shell and term
(add-hook 'term-mode-hook 'ansi-color-for-comint-mode-on)

; Turn off the recoloring for the terminal so it keeps the default emacs colors
(setq term-default-bg-color nil)
(setq term-default-fg-color nil)

; Set forced colors when entering the terminal
;(add-hook 'term-mode-hook (lambda () (set-face-background 'default "black")))
;(add-hook 'term-mode-hook (lambda () (set-face-foreground 'default "green3")))

;; Turn off elscreen tabs by default when starting a multi-term session
(add-hook 'term-mode-hook (lambda () (setq elscreen-display-tab nil) (elscreen-notify-screen-modification 'force)))

; Turn off the scrollbars by default when starting multi-term session
; Put the scrollbars on the right
(add-hook 'term-mode-hook (lambda () (scroll-bar-mode 0)))

;; Undefine the key C-a so we can use minicom
;(global-unset-key [(control a)])

;; LINUM
;; Numbers the lines of a file on the left side.  Numbering is done 
;; on each window.
;; Set "linum-on" as a hook function for the major modes you want
;; it automatically turned on for.
;;
;; load the linum plugin
(load-file "~/.emacs.d/linum.el")
(require 'linum)

;; left aligns the numbering with space between numbers 
;; and content (pick one)
;;(setq linum-format "%d ")
;; right aligns the numbering with a space between numbers and content
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;; CLEARCASE
;; Adds support for automatically doing clearcase commands.
;; See keys below
;;
;; doesn't work if auto-loaded
;;
;; Load the clearcase plugin
;(load-file "~/.emacs.d/clearcase.el")

; turn off checkout comments
;(setq clearcase-suppress-checkout-comments 1)

; clearcase key commands
; C-x C o          checkout current
; C-x C i          checkin current
; C-x C diff       diff current versus pred
; C-x C edcs       edit current configspec
; C-x C lsco       list all current checkouts in view
; C-x C mkelem     make the current buffer an element
; C-x C unco       uncheckout the current buffer
;(define-key global-map [(control x) (C) (o)] 'clearcase-checkout-current-buffer)
;(define-key global-map [(control x) (C) (i)] 'clearcase-checkin-current-buffer)
;(define-key global-map [(control x) (C) (d) (i) (f) (f)] 'clearcase-ediff-pred-current-buffer)
;(define-key global-map [(control x) (C) (e) (d) (c) (s)] 'clearcase-edcs-edit)
;(define-key global-map [(control x) (C) (l) (s) (c) (o)] 'clearcase-find-checkouts-in-current-view)
;(define-key global-map [(control x) (C) (m) (k) (e) (l) (e) (m)] 'clearcase-mkelem-current-buffer)
;(define-key global-map [(control x) (C) (u) (n) (c) (o)] 'clearcase-uncheckout-current-buffer)

;currently replaced with Helm
;;; BUFFSWITCH
;;; originally named bs.el
;;; A better buffer switching script.  Buffer shows only open 
;;; buffer and buffers associated with files unless prefaced 
;;; with C-u and allows click/enter selection to jump to 
;;; buffer under point in addition to showing details about 
;;; buffers.
;;; C-x C-b lists limited buffers, C-u C-x C-b lists all
;;;
;;; Load the buffer select script
;(load-file "~/.emacs.d/buffswitch.el")
;;(require 'buffswitch)
;
;; remap default buffer list to buffer select script
;(define-key global-map [(control x) (control b)] 'bs-show) 

;; COMPANY
;; An auto-completion tool that can use various backends.  It's way better maintained than autocomplete
;; and almost everyone seems to be using it instead of autocomplete as a result
(require 'company)
; always enable in lisp-mode (it may already be enabled anyway)
(add-hook 'lisp-mode-hook 'company-mode)

; don't let TAB be overridden
(define-key company-active-map (kbd "<tab>") nil)
; don't let space be overridden
(define-key company-active-map (kbd "<spc>") nil)

; Set a key binding to force start
(global-set-key (kbd "M-'") 'company-complete)

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

;;; SR-SPEEDBAR
;;; Makes speedbar open in a small side window within the same frame instead of
;;; in a different frame.  Speedbar is basically the directory heirarchy.
;(load-file "~/.emacs.d/sr-speedbar.el")
;(require 'sr-speedbar)
;
;; auto-open the speedbar when C++ or C mode are entered
;;(add-hook 'c++-mode 'sr-speedbar-open)
;;(add-hook 'c-mode 'sr-speedbar-open)
;
;; Create a key-binding so the speedbar can be accessed (normally it's skipped when jumping between windows)
;;(global-set-key (kbd "M-9") 'sr-speedbar-select-window)
;
;; Various appearance settings
;(setq sr-speedbar-default-width 15)
;(setq sr-speedbar-max-width 3)
;(setq sr-speedbar-right-side nil)
;;(setq sr-speedbar-skip-other-window-p t)
;(setq speedbar-use-images nil)

;; PROJECTILE
;; A general project integration tool that handles fuzzy matches and whatnot
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)

(defun if-projectile-projectile-compile-project-or-compile ()
"Determines based on the current buffer whether within a projectile project or not.
If within a projectile project, the function `projectile-compile-project' is used, 
otherwise the function `compile' is used.
Using the non-projectile function can be forced by preceeding the command with \\[universal-argument].
"
  (interactive)
  (call-interactively
    (if (and (projectile-project-p) (equal current-prefix-arg nil))
      'projectile-compile-project
      'compile
      )
    )
  )

(defun if-projectile-projectile-grep-or-rgrep ()
"Determines based on the current buffer whether within a projectile project or not.
If within a projectile project, the function `projectile-grep' is used, otherwise the
function `rgrep' is used.  
Using the non-projectile function can be forced by preceeding the command with \\[universal-argument].
"
  (interactive)
  (call-interactively
    (if (and (projectile-project-p) (equal current-prefix-arg nil))
      'projectile-grep
      'rgrep
      )
    )
  )
;re-define the compile command to automatically perform it on the projectile project
;when we're in projectile projects
(define-key (current-global-map) [remap compile] 'if-projectile-projectile-compile-project-or-compile)
(define-key (current-global-map) [remap rgrep] 'if-projectile-projectile-grep-or-rgrep)


;; HELM
;; Basically a replacement for Ido, it changes all normal minibuffer interactions to be fuzzy actions
;; when the mode is set
(require 'helm)
(helm-mode 1)
(require 'helm-config)

; default helm keybinding is C-x c which is almost C-x C-c that's used to exit emacs.  Remap it
(global-set-key (kbd "C-d") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

; swap these around so C-e say "do everything" and C-z brings up the action list
; rebind tab to run persistent action
(define-key helm-map (kbd "<tab>") nil)
;provide an alternate for use in terminals
(define-key helm-map (kbd "C-e") 'helm-execute-persistent-action) 
; list actions using C-z
(define-key helm-map (kbd "C-z")  'helm-select-action) 

; Use the helm buffer list
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
; remap some buffer control keys to something that makes sense
(define-key helm-buffer-map (kbd "C-k") 'helm-delete-current-selection)
(define-key helm-buffer-map (kbd "C-c C-k") 'helm-delete-current-selection)

; Pick up the last helm session (allows resume of last command after canceling
(global-set-key (kbd "C-c C-c") 'helm-resume)

; map the ergo key behavior to the helm interface for all the maps it makes sense
(let ((map helm-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)
)
(let ((map helm-etags-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)
)
(let ((map helm-c-grep-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)
(let ((map helm-generic-files-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)
(let ((map helm-buffers-ido-virtual-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)

(let ((map helm-buffer-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)

(let ((map helm-buffer-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)

(let ((map helm-grep-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)



; turn on autoresize mode just so we can set the max and min limits
(setq helm-autoresize-mode t)
(setq helm-autoresize-max-height 20) ;20%
(setq helm-autoresize-min-height 20) ;20%

; fuzzy match the M-x commands in helm mode
(setq helm-M-x-fuzzy-match t)

;; HELM PROJECTILE
;; Projectile limited search using the helm interface.  This basically gives you
;; an unqualified file name search within the auto-detected project.
(require 'helm-projectile)

; Set a key command for the find file using projectile (only works if within a known project)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)
; effectively a header/source file toggle command
(global-set-key (kbd "C-c h") 'helm-projectile-find-other-file)
; locates the file under the cursor within the project
(global-set-key (kbd "C-c f") 'helm-projectile-find-file-dwim)

; Ergo keys for interface
; Unset helm-ff-properties-persistent since we want to use it for UP instead (M-i)
; Unset helm-ff-run-kill-buffer-persistent since we want to use it for PgDn instead (M-K)
; Unset helm-ff-rotate-left-persistent since we want to use it for find next source instead (M-l)
(let ((map helm-projectile-find-file-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)

;; HELM SWOOP
;; Swoop integration into helm.  Basically an advanced version of C-s with a matched results buffer
(require 'helm-swoop)

; start a swoop search with C-e
(global-set-key (kbd "C-e") 'helm-swoop)
(global-set-key (kbd "C-S-e") 'helm-swoop-back-to-last-point)

; key combo to switch to swoop from normal C-s
(define-key isearch-mode-map (kbd "C-e") 'helm-swoop-from-isearch)
; unmap the default key mapping of M-i while in isearch
(define-key isearch-mode-map (kbd "M-i") nil)

; switch to multi-swoop from regular swoop (multi-file)
(define-key helm-swoop-map (kbd "C-e") 'helm-multi-swoop-all-from-helm-swoop)

; Ergo keys for swoop
(let ((map helm-swoop-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)

(let ((map helm-multi-swoop-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)
(let ((map helm-multi-swoop-buffers-map))
  (define-key map [(meta i)] 'helm-previous-line)
  (define-key map [(meta k)] 'helm-next-line)
  (define-key map [(meta j)] 'helm-previous-source)
  (define-key map [(meta l)] 'helm-next-source)
  (define-key map [(meta I)] 'helm-previous-page)
  (define-key map [(meta K)] 'helm-next-page)
  (define-key map (kbd "<tab>") nil)  
)

;side-by-side search results
(setq helm-swoop-split-direction 'split-window-horizontally)

; for some reason helm-swoop is somehow overriding the global TAB to be helm-swoop.  Put it back
(global-set-key (kbd "<tab>") 'indent-for-tab-command)

;; HELM SEMANTIC
;; Semantic is a sub-set of the CEDET system, but is actually useful without setting up crazy
;; projects in EDE.  It can auto-parse files to the best of its abilities, and will parse the
;; files in the surrounding directory as well.  It does special code highlighting, etc.  It's
;; built into emacs 23.2 and later, so it can be customized through a simple customize-group
;; Helm provides some semantic interfaces, mostly just searching the symbols in the file.
(global-set-key (kbd "C-c C-s") 'helm-semantic-or-imenu)
;(global-set-key (kbd "C-M-,") 'semantic-symref)
;(global-set-key (kbd "M-'") 'semantic-analyze-possible-completions)

; fuzzy match semantic matches in helm mode
(setq helm-semantic-fuzzy-match t)

;; WINNER MODE
;; This is already included in default emacs as of 20.  It allows window configuration changes
;; to have an undo/redo history.  It's useful if pulling up cscope results when window already
;; then returning to the splits that were already there

(setq winner-mode t)
; defaults are C-c left and C-c right, just ad C-j and C-l as right and left
(global-set-key (kbd "C-c C-j") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)

;; SMART-MODE-LINE
;; Color coded mode line.  Setup is reached by running the command "sml/customize".  Otherwise
;; everything is simply setup here with this single command

(sml/setup)

;; RICH-MINORITY
;; Used to filter what minor modes get listed.  Useful for with smart-mode-line

;automatically enable this
;(rich-minority-mode 1) ;;This command isn't necessary is SML is used, though the plugin is required

;list of minor modes to never show in the list.  Note that most start with a space
(setq rm-blacklist '(" Helm"
                     " company"
                     " Abbrev"
                     " Fill"
                     " ARev"
                     " Tail"
                     " Fly"
                     " o^o"
                     " Chg"
                     " Outl"
                     " Egg"
                     " GG"
                     " FA"))

;; BUFFER CYCLE
;; Enables C-TAB cycling through buffers.
;;
;; doesn't work if auto-loaded
;;
;; Load the buffer switch script
;(load-file "~/.emacs.d/ibs.el")

;; XCSCOPE
;; Interfaces to cscope by checking cscope files in 
;; different directories, possibly multiple cscope 
;; files.  Lists results of search in buffer with 
;; selectable locations.
;;
;; doesn't work if auto-loaded
;;
;; Load xcscope
;(load-file "~/.emacs.d/xcscope/xcscope.el")
(require 'xcscope)

;; when indexing, index to file not location indexing was run from
(setq cscope-use-relative-paths 1)

;; Prevent the database from being updated
(setq cscope-do-not-update-database 1)

;; Don't automatically go to match if there's only one
(setq cscope-edit-single-match nil)

;; Don't show search time
;(setq cscope-display_times nil)

;; Don't show empty matches
;(setq cscope-suppress-empty-matches 1)

;; doesn't show buffer by default if turned on (default is true)
;(setq cscope-display-cscope-buffer nil)

; Setup some cscope key bindings for quick access
(define-key global-map (kbd "C-M-.") 'cscope-find-this-symbol)
(define-key global-map (kbd "C-.") 'cscope-find-global-definition)
(define-key global-map (kbd "C-/") 'cscope-find-functions-calling-this-function)
(global-set-key (kbd "C-,") 'cscope-pop-mark)

; make sure movement keys aren't overridden
(define-key cscope-list-entry-keymap (kbd "M-k") nil)
(define-key cscope-list-entry-keymap (kbd "M-K") nil)
(define-key cscope-list-entry-keymap (kbd "M-i") nil)
(define-key cscope-list-entry-keymap (kbd "M-I") nil)
(define-key cscope-list-entry-keymap (kbd "M-l") nil)
(define-key cscope-list-entry-keymap (kbd "M-L") nil)
(define-key cscope-list-entry-keymap (kbd "M-j") nil)
(define-key cscope-list-entry-keymap (kbd "M-J") nil)
(define-key cscope-list-entry-keymap (kbd "M-o") nil)
(define-key cscope-list-entry-keymap (kbd "M-u") nil)

;drop keys from the map we never intend to use
(define-key cscope-list-entry-keymap (kbd "A") nil)
(define-key cscope-list-entry-keymap (kbd "C") nil)
(define-key cscope-list-entry-keymap (kbd "D") nil)
(define-key cscope-list-entry-keymap (kbd "E") nil)
(define-key cscope-list-entry-keymap (kbd "G") nil)
(define-key cscope-list-entry-keymap (kbd "I") nil)
(define-key cscope-list-entry-keymap (kbd "L") nil)
(define-key cscope-list-entry-keymap (kbd "W") nil)
(define-key cscope-list-entry-keymap (kbd "a") nil)
(define-key cscope-list-entry-keymap (kbd "c") nil)
(define-key cscope-list-entry-keymap (kbd "d") nil)
(define-key cscope-list-entry-keymap (kbd "e") nil)
(define-key cscope-list-entry-keymap (kbd "f") nil)
(define-key cscope-list-entry-keymap (kbd "f") nil)
(define-key cscope-list-entry-keymap (kbd "i") nil)
(define-key cscope-list-entry-keymap (kbd "k") nil)
(define-key cscope-list-entry-keymap (kbd "o") nil)
(define-key cscope-list-entry-keymap (kbd "r") nil)
(define-key cscope-list-entry-keymap (kbd "s") nil)
(define-key cscope-list-entry-keymap (kbd "t") nil)
(define-key cscope-list-entry-keymap (kbd "u") nil)

; map these to jump results instead of just single lines
(define-key cscope-list-entry-keymap (kbd "n") 'cscope-history-forward-result)
(define-key cscope-list-entry-keymap (kbd "p") 'cscope-history-backward-result)

; reverse these so lowercase is result jump and uppercase is file jump
(define-key cscope-list-entry-keymap (kbd "M-n") 'cscope-history-forward-result)
(define-key cscope-list-entry-keymap (kbd "M-p") 'cscope-history-backward-result)
(define-key cscope-list-entry-keymap (kbd "M-N") 'cscope-history-forward-file)
(define-key cscope-list-entry-keymap (kbd "M-P") 'cscope-history-backward-file)


;; The folilowing sets up the search paths for the 
;; cscope.out file based on the file in the current
;; buffer.  The format is 
;; '( (REGEX (PATH1) (PATH2)) (REGEX (PATH1) (PATH2)) )
;; If the regex matches the file in the current buffer,
;; the paths are searched in order.  Specifying ( t )
;; as the path means it will search each directory
;; starting from the current one and moving upward till
;; root is reached for a cscope.out file.  If none is
;; is found or the stop at single database flag isn't
;; set it will continue working through the search paths.
;; Optionally a "path" can be set that triggers a cscope
;; run, but if the stop at single database flag isn't set
;; it will always run the cscope command (slow).
;; NOTE: cscope can not resolve the ~ symbol to the home
;;       directory, so it cannot be used in the paths
;;       specified here.
;; NOTE: If a path cannot be found, the search stops 
;;       immediately and will fail to process any further 
;;       entries.  Be sure to use existing directories 
;;       as the path rather than specifying files that 
;;       might or might not exist.
;; NOTE: Individual files don't work very well in this
;;       list, so if the files aren't named according to
;;       the default name specified in the settings,
;;       it seems to be hit or miss whether it finds the
;;       file at all, and if it doesn't find the file
;;       it stops looking for any more files.
(setq cscope-database-regexps 
   '(
     (".*"
      ( t )
      ( "/home/mtalexander/modular/" )
      ( "/home/mtalexander/rrsdk/ksi/" )
      t      ;; stop here if matches are found
      ( "/home/mtalexander/emacs_tags/modular/" )
      ( "/home/mtalexander/emacs_tags/OR1BusDev/" )
      ( "/home/mtalexander/emacs_tags/rrsdk/" )
      t      ;; stop here if matches are found
      ( "/home/mtalexander/emacs_tags/everything/" )
     )
    )
)

;; TAGS
;; Setting the following provides a list of TAG files for emacs to include.  Without
;; it only the current directory will be searched for TAG file.
(setq tags-table-list
      '("~/emacs_tags/modular"
        "~/emacs_tags/OR1BusDev"
        "~/emacs_tags/rrsdk"))

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

;; FUNCTION-ARGS
;; A tool intended to just display function arguments as tool tips and support overridden functions,
;; but it ends up extending the built in CEDET (and especially Semantic) to support C++ like it
;; doesn't
(require 'function-args)
(fa-config-default)

;this helps with parsing by making .h files be c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;case insensitive database
;(set-default 'semantic-case-fold t)
;add non-default include paths this way
;(semantic-add-system-include "~/some/path/to/standard/headers" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/component-sources/bios_6_33_05_46/packages/ti/bios/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/component-sources/xdctools_3_23_03_53/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/component-sources/xdctools_3_23_03_53/packages/ti/platforms/stellaris/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/component-sources/rpe_1_00_01_13/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/component-sources/rpe_1_00_01_13/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/linux-devkit/arm-none-linux-gnueabi/usr/lib/dbus-1.0/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/linux-devkit/arm-none-linux-gnueabi/usr/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/linux-devkit/arm-none-linux-gnueabi/usr/include/services4/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/linux-devkit/arm-none-linux-gnueabi/usr/include/services4/system/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/linux-devkit/arm-none-linux-gnueabi/usr/include/services4/srvkm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/proprietary/ezsdk-5_05_02_00/ezsdk/linux-devkit/arm-none-linux-gnueabi/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/libffi-3.0.10/arm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/libffi-3.0.10/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/boost/spirit/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/boost/spirit/repository/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/boost/fusion/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/tools/build/v2/example/pch/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/tools/build/v2/example/libraries/util/foo/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/tools/build/v2/test/railsys/program/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/tools/build/v2/test/railsys/libx/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/tools/build/v2/engine/src/boehm_gc/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/boost-1.45.0/boost_1_45_0/libs/mpl/preprocessed/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/qt-4.7.4/arm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/qt-4.7.4/src/src/3rdparty/freetype/builds/amiga/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/qt-4.7.4/src/src/3rdparty/freetype/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/qt-4.7.4/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/i2c-tools-3.0.3/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/iproute2-2.6.37/arm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/iproute2-2.6.37/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/libxml2-2.7.8/arm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/libxml2-2.7.8/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/busybox/.pc/integration.patch/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/busybox/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/busybox/src/include/config/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/mtdutils-1.4.2/src/ubi-utils/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/mtdutils-1.4.2/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/e2fsprogs-1.41.9/arm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/e2fsprogs-1.41.9/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/freetype-2.4.4/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/lzo-2.04/arm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/lzo-2.04/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/util-linux-2.19/arm/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/util-linux-2.19/src/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/apps/gst-plugins-bad-1.0.5/src/sys/linsys/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fsdev/usr/lib/libffi-3.0.10/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fsdev/usr/lib/glib-2.0/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fsdev/usr/lib/dbus-1.0/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fsdev/usr/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fsdev/usr/include/boost/spirit/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fsdev/usr/include/boost/spirit/repository/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fsdev/usr/include/boost/fusion/include" 'c++-mode)
(semantic-add-system-include "~/rrsdk/ksi/fs/fs/usr/include" 'c++-mode)

; Function Args really should have a minor mode that activates on the fa-show call since half of the
; available actions only apply after an fa-show call and before an fa-abort
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
  
  ;activating does fa-show, deactivating does fa-abort  
  (if function-args-active-mode
      (fa-active-enter)
      (fa-active-exit)) 
  )

(defun fa-active-enter ()
  (interactive)
  "Handlling for when the function-args-active-mode is enabled.  Does fa-show and pushes a mark."
  (fa-show)
  (push-mark))

(defun fa-active-exit ()
  (interactive)
  "Handlling for when the function-args-active-mode is enabled.  Does fa-show and pushes a mark."
  (fa-abort))

(defun fa-active-end ()
  (interactive)
  "Turns off the function-args-active-mode, which implicitly aborts"
  (function-args-active-mode 0))

(defun fa-mode-disable-check ()
  "For use in the function-args-mode-hook.  
   Checks to see if function-args-mode is being disabled and disables function-args-active-mode as well."
  (if function-args-mode
      nil
    (function-args-active-mode 0)))

(defun fa-active-jump ()
  (interactive)
  "Handles the fa-jump call which needs to perform an fa-abort"
  (push-mark)
  (fa-jump)
  (fa-active-end) ;fa-abort gets ignored here for some reason, so do it explicitly next
  (fa-abort))

;force the function-args-active-mode to turn off with the function-args-mode
(add-hook 'function-args-mode-hook 'fa-mode-disable-check)
(provide 'function-args-active-mode)

(let ((map function-args-mode-map))
  ;key bindings weren't under a prefix map so clear them all
  (define-key map (kbd "M-o") nil)
  (define-key map (kbd "M-i") nil)
  (define-key map (kbd "M-n") nil)
  (define-key map (kbd "M-h") nil)
  (define-key map (kbd "M-u") nil)
  (define-key map (kbd "M-j") nil)
  (define-key map (kbd "C-M-j") nil)
  ; Now remap only the ones we want to something useable
  (define-key map (kbd "M-;") 'moo-complete)
  (define-key map (kbd "M-:") 'function-args-active-mode)
  (define-key map (kbd "C-c C-s") 'moo-jump-local) ; intentionally override the helm-semantic-or-imenu  
)

; this line is necessary to be sure it's loaded before we try to adjust the map.  It's loaded indirectly by function-args
(require 'ivy)
; moo-complete uses ivy in a minibuffer so map some of the movement commands
(let ((map ivy-minibuffer-map))
  (define-key map (kbd "M-n") 'ivy-next-line)
  (define-key map (kbd "M-k") 'ivy-next-line)
  (define-key map (kbd "M-K") 'ivy-scroll-up-command)  
  (define-key map (kbd "M-p") 'ivy-previous-line)
  (define-key map (kbd "M-i") 'ivy-previous-line)
  (define-key map (kbd "M-I") 'ivy-scroll-down-command)
  (define-key map (kbd "M-j") 'ivy-beginning-of-buffer)
  (define-key map (kbd "M-l") 'ivy-end-of-buffer))

;; SEMANTIC FIX
;; Semantic relies on EDE to provide the file list it needs to support.  EDE is retarded and doesn't
;; work right, especially on C++.  Someone wrote a fix that will recursively parse all files in all 
;; sub-directories.
;(load-file "~/.emacs.d/semantic.el")

(defvar c-files-regex ".*\\.\\(c\\|cpp\\|h\\|hpp\\)$"
  "A regular expression to match any c/c++ related files under a directory")

(defvar c-files-exclude-regex ".*_moc\\..*$"
  "A regular expression to match moc files that shouldn't be parsed")

(defun my-semantic-parse-dir (root regex regex-no)
  "
   This function is an attempt of mine to force semantic to
   parse all source files under a root directory. Arguments:
   -- root: The full path to the root directory
   -- regex: A regular expression against which to match all files in the directory
   -- regex-no: A regular expression that when matched will cause a file to be skipped
  "
  (let (
        ;;make sure that root has a trailing slash and is a dir
        (root (file-name-as-directory root))
        (files (directory-files root t ))
       )
    ;; remove current dir and parent dir from list
    (setq files (delete (format "%s." root) files))
    (setq files (delete (format "%s.." root) files))
    (setq files (delete (format "%s.git" root) files))
    ;add any other directories in the root path that need to be ignored
    (while files
      (setq file (pop files))
      (if (not (file-symlink-p file))
        ;it's not a symlink (we ignore those to prevent infinite loops)
        (if (file-accessible-directory-p file)
          ;;it's a directory
          (my-semantic-parse-dir file regex regex-no)
          ;;else it's not a directory
          (progn
            ;;if it's a file that matches the regex but not the regex-no
            (when (and (string-match-p regex file)
                            (not (string-match-p regex-no file)))
               (save-excursion
                 (semanticdb-file-table-object file))
               )
            )
          )
        )
     )
  )
)

(defun my-semantic-parse-current-dir (regex regex-no)
  "
   Parses all files under the current directory matching regex
  "
  (my-semantic-parse-dir (file-name-directory(buffer-file-name)) regex regex-no)
  (semanticdb-save-all-db) ;force save the db between directories so we handle big trees
)

(defun lk-parse-curdir-c ()
  "
   Parses all the c/c++ related files under the current directory
   and inputs their data into semantic
  "
  (interactive)
  (my-semantic-parse-current-dir c-files-regex c-files-exclude-regex)
)

(defun lk-parse-dir-c (dir)
  "Prompts the user for a directory and parses all c/c++ related files
   under the directory
  "
  (interactive (list (read-directory-name "Provide the directory to search in:")))
  (my-semantic-parse-dir (expand-file-name dir) c-files-regex c-files-exclude-regex)
)

(defun semantic-projectile-parse-project ()
  "Automatically does a lookup using projectile to find the current project root and then parses all
   files in all subdirectories that match the c-files-regex but not the c-files-exclude-regex.
   WARNING: This is VERY slow, only do it if you plan on waiting a while.
  "
  (if (not (projectile-project-root))
    (error "Projectile project root is not set")
    (lk-parse-dir-c (projectile-project-root))
  )
)
(defun projectile-semantic-parse-project ()
  "Wrapper to semantic-projectile-parse-project"
  (semantic-projectile-parse-project)
  )

(provide 'lk-file-search)

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

;;CEDET
;; It is now included in Emacs (23.2 and later) and already enabled.  Advanced
;; setup is all that's required
;(require 'semantic/ia)
;(require 'semantic/bovine/gcc)
;(semantic-add-system-include "/opt/codesourcery/arm-2009q1-203/arm-none-linux-gnueabi/include/c++/4.3.3" 'c++-mode)
;(semantic-add-system-include "~/code/rrsdk/ksi/fs/apps/qt-4.7.4/src/include" 'c++-mode)
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file "~/code/rrsdk/ksi/fs/apps/qt-4.7.4/src/include/Qt/qconfig.h")
;;(add-to-list 'semantic-lex-c-preprocessor-symbol-file "~/code/rrsdk/ksi/fs/apps/qt-4.7.4/src/include/Qt/qconfig-dist.h")
;
;(require 'ede)
;(global-ede-mode 1)
;
;(ede-cpp-root-project "RRSDK"
;                      :name "RRSDK Project"
;                      :file "~/code/.anchor"
;                      :include-path '("/include" "../include/" "../../include")
;                      :system-include-path '("~/code/rrsdk/ksi/fs/apps/qt-4.7.4/src/include" "/opt/codesourcery/arm-2009q1-203/arm-none-linux-gnueabi/include/c++/4.3.3")
;                      )
                                        ;
;; VISIBLE-MARK
;; A mode where all the marks are made visible.  It's setup to have customization
;; settings, but the global mode setting doesn't actually work
(require 'visible-mark)
(global-visible-mark-mode t)

;; C++ File Identification Change
;; Identify .h files as C++ by default rather than C
;; For some reason adding this to the customize menu causes a warning.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; GIT-GUTTER-FRINGE+
;; This is a variant style of git-gutter+, which works with linnum.
;; It shows symbols on the edge to indicate changes to git tracked code
; for some reason fringe mode doesn't install the same as the base gutter+ mode, so it has to be
; called explicitly here in order to trigger.
(require 'git-gutter-fringe+)
;keep skin minimal (smaller text)
(git-gutter-fr+-minimal)

;; setup a sub-map so all commands can use a fixed prefix
(define-prefix-command 'git-gutter+-child-map)
; the key combo to activate the child map
(define-key git-gutter+-mode-map (kbd "C-x h") 'git-gutter+-child-map)
;;; Jump between hunks
(define-key git-gutter+-child-map (kbd "n") 'git-gutter+-next-hunk)
(define-key git-gutter+-child-map (kbd "p") 'git-gutter+-previous-hunk)
;;; Act on hunks
(define-key git-gutter+-child-map (kbd "h") 'git-gutter+-show-hunk)
(define-key git-gutter+-child-map (kbd "r") 'git-gutter+-revert-hunks)
;; Stage hunk at point.
;; If region is active, stage all hunk lines within the region.
(define-key git-gutter+-child-map (kbd "s") 'git-gutter+-stage-hunks)
(define-key git-gutter+-child-map (kbd "U") 'git-gutter+-unstage-whole-buffer)

;; GGTAGS
; Both ggtags and helm-gtags are installed through the package manager.  To be efficient,
; gtags (called "global") should be compiled from source with exuberant-ctags.  Also for it
; to parse correctly, the python package "pygments" should be installed as well.
; For better and faster lookup support, id-utils should also be installed so it uses a database instead of a text
; based lookup for the symbol in all files.
; The full set of requirements for this are exuberant-ctags, pygment, id-utils, global.
; Be careful because there's an emacs tool called ctags that is not the same as exuberant-ctags.
; Look up ggtags for installation details of them all.

; Automatically enable ggtags mode so it will indicate when a symbol is identified and will be used instead of the default etags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

; Map meta sub-keys to do the cscope equivalent commands using ggtags
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "M-/") 'ggtags-find-reference)
(global-set-key (kbd "M-]") 'ggtags-idutils-query)

                                        ; Add these keys to the ggtags navigation map
(define-key ggtags-navigation-map (kbd "M-u") 'ggtags-navigation-previous-file)
(define-key ggtags-navigation-map (kbd "M-o") 'ggtags-navigation-next-file)
(define-key ggtags-navigation-map (kbd "M-l") 'ggtags-navigation-visible-mode)
(define-key ggtags-navigation-map (kbd "M-j") 'ggtags-navigation-visible-mode)
(define-key ggtags-navigation-map (kbd "M-k") 'next-error)
(define-key ggtags-navigation-map (kbd "M-i") 'previous-error)


                
