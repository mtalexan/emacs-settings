;; An alternative to helm or ido

;; NOTE: Counsel should really be used instead, it has ivy as a dependency,
;;       but significantly extends what it can do.
(use-package ivy
  :ensure t
  :commands (
     ivy-mode
     ivy-resume
     ivy-minibuffer-map
   ) ; end :commands
  :init
    (ivy-mode 1)
  :config
    ;; Includes `recentf-mode' and bookmarks in `ivy-switch-buffer'
    ;; completion candidates
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)

    ;; How to display the number of candidate matches.  Default is "%d ".
    ;; Following displays the item number of the current selection as well.
    (setq ivy-count-format "(%d/%d) ")

    ;; When reaching top or bottom of list, wrap to the other end.
    ;; Default is off/nil
    ;(setq ivy-wrap t)

    ;; Default number of lines in ivy prompt. Default is 10
    ;(setq ivy-height 10)

    ;; Sets the match function: `ivy--regex', `ivy--regex-plus',
    ;; `ivy--regex-ignore-order', `ivy--regex-fuzzy', or `regexp-quote'.
    ;; default is `ivy--regex-plus'
    (setq ivy-re-builders-alist
          '((t . ivy--regex-ignore-order)))

    ;; What to do when hitting DEL in buffer with nothing left to delete.
    ;; Default is to exit the ivy session.  Set to nil means do nothing
    (setq ivy-on-del-error-function nil)

    ;; Copy `ivy-yank-word', and replace the contents of the
    ;; `with-ivy-window' call with the equivalent logic from
    ;; `isearch-forward-symbol-at-point'
    (defun ivy-yank-symbol ()
      "Pull next word from buffer into search string."
      (interactive)
      (let (amend)
        (with-ivy-window
          ;; start of from isearch-forward-symbol-at-point
          (let ((bounds (find-tag-default-bounds)))
            (cond
             (bounds
              (when (< (car bounds) (point))
                (goto-char (car bounds)))
              ;;setq amend instead of direct usage of buffer-substring-no-properties
              (setq amend (buffer-substring-no-properties (car bounds) (cdr bounds)))))))
           ;' end of from isearch-forward-symbol-at-point
             (when amend
               (insert (replace-regexp-in-string "  +" " " amend)))))

  :bind (
     ("C-c C-r" . ivy-resume) ; also re-bound in counsel to the same thing

     ;; NOTE: This map is inherited by multiple counsel maps that are
     ;;       customizable by specific function being performed.  Only
     ;;       minimal changes should be included here.
     :map ivy-minibuffer-map
       ;; defaults
       ("C-n" . ivy-next-line)
       ("C-p" . ivy-previous-line)
       ("M-<" . ivy-beginning-of-buffer)
       ("M->" . ivy-end-of-buffer)
       ("C-v" . ivy-scroll-up-command)
       ("M-v" . ivy-scroll-down-command)
       ("C-m" . ivy-done)
       ("RET" . ivy-done)
       ;("M-o" . ivy-dispatching-done)
       ("C-o" . ivy-dispatching-done)
       ("C-j" . ivy-alt-done) ; includes directory completion via current selection
       ("TAB" . ivy-partial-or-done)
       ;("C-M-j" . ivy-immediate-done) ; necessary for when creating new file from find-file
       ("C-l" . ivy-immediate-done) ; for some reason C-J overwrites C-j keybinding too
       ;("C-'" . ivy-avy)
       ("M-;" . ivy-avy) ; match the key used for avy-isearch
       ("C-M-m" . ivy-call) ; do default on candidate, but don't exit ivy
       ("C-M-o" . ivy-dispatching-call) ; prompt for action on candidate, but when done don't exit ivy
       ("C-M-n" . ivy-next-line-and-call) ; ivy-call, but move to next line in ivy afterward
       ("C-M-p" . ivy-previous-line-and-call) ; ivy-call, but move to previous line in ivy afterward
       ("M-n" . ivy-next-history-element)
       ("M-p" . ivy-previous-history-element)
       ;("M-i" . ivy-insert-current)
       ;("M-j" . ivy-yank-word) ; from point
       ("C-w" . ivy-yank-symbol) ; from point
       ("S-SPC" . ivy-restrict-to-matches)
       ("C-r" . ivy-reverse-i-search) ; searches thru ivy history for specific command set
       ("M-w" . ivy-kill-ring-save)
       ;("C-o" . hydra-ivy/body) ; requires hydra
       ("C-c C-o" . ivy-occur)
       ;; in file mode, M-r switches between regex and non-regex mode

       ;; Make the ivy area larger or smaller
       ("C-+" . ivy-minibuffer-grow)
       ("C--" . ivy-minibuffer-shrink)

       ;; Ergo
       ("M-k" . ivy-next-line)
       ("C-M-k" . ivy-next-line-and-call)
       ("M-K" . ivy-scroll-up-command)
       ("M-i" . ivy-previous-line)
       ("C-M-i" . ivy-previous-line-and-call)
       ("M-I" . ivy-scroll-down-command)
       ("M-j" . left-char)
       ("C-M-j" . backward-word)
       ("M-l" . right-char)
       ("C-M-l" . forward-word)
       ("M-o" . move-end-of-line)
       ("M-u" . move-beginning-of-line)

   ) ;end of :bind
  ) ; end of use-package




