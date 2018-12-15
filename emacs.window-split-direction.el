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
