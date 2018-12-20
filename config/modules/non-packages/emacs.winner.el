(require 'winner)
;; WINNER MODE
;; This is already included in default emacs as of 20.  It allows window configuration changes
;; to have an undo/redo history.  It's useful if pulling up cscope results when window already
;; then returning to the splits that were already there

(setq winner-mode t)
; defaults are C-c left and C-c right, just ad C-j and C-l as left and right
(global-set-key (kbd "C-c C-j") 'winner-undo)
(global-set-key (kbd "C-c C-l") 'winner-redo)
