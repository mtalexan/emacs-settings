(require 'tabify)
;; Changes the tabify to only operate on leading whitespace
(setq tabify-regexp "^\t* [ \t]+")

;; Toggle indent-tabs-mode
;; A function that just toggles the status, which only affects the current
;; buffer. After toggle, it prints a message to the minibuffer indicating
;; the new state
(defun toggle-indent-tabs-mode-p ()
  "Toggles the indent with tabs mode for the current buffer"
  (interactive)
  (if indent-tabs-mode
      (setq indent-tabs-mode nil)
    (setq indent-tabs-mode t))
  (message
   "Indent with tabs mode is now: %s"
   indent-tabs-mode))

(provide 'toggle-indent-tabs-mode-p)

;; assign it to a key
(global-set-key (kbd "C-c t") 'toggle-indent-tabs-mode-p)
