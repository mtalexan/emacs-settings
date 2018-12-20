;; Nothing to require here, window is built-in
;(require 'window)

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

(provide 'toggle-window-dedicated)
; assign a key to the function
(global-set-key [Scroll_Lock] 'toggle-window-dedicated)
