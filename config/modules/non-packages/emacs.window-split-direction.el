;; This is built-in and doesn't provide a matching feature, so it can't be
;; called here and should just be assumed.
;(require 'window)

;; Window Split Direction Preference
;; To set how windows automatically get split when creating a new buffer, there are
;; two parts.  The first is to customize when we decide we shouldn't split in a given
;; direction.  The function `split-window-sensibly' is normally the option setting for the
;; `split-window-preferred-function' setting which is called when this determination needs
;; to be made.  The `split-window-sensibly' function looks at the `split-height-threshold'
;; value, and if it's not nil and the window has at least that many lines in it, it will
;; split vertically (top-bottom).  If the window doesn't have enough lines in it, it will
;; check `split-width-threshold' to see if the window has sufficient columns in it.  If it
;; does, it will split horizontally (left-right).  If both aren't met, it will steal an
;; open window and use that instead.  If we want to prefer horizontal (left-right) splitting
;; over vertical (top-bottom) splitting, we need an entirely new function.

(defun split-window-sensibly-prefer-below-default-below (&optional window)
    "A duplicate of `split-window-sensibly' with a better name.  It tries
to split below first, then will try splitting to the right, then ends up
splitting below if neither would otherwise work.

You can enforce this function to not split WINDOW horizontally,
by setting (or binding) the variable `split-width-threshold' to
nil.  If, in addition, you set `split-height-threshold' to zero,
chances increase that this function does split WINDOW vertically.

In order to not split WINDOW vertically, set (or bind) the
variable `split-height-threshold' to nil.  Additionally, you can
set `split-width-threshold' to zero to make a horizontal split
more likely to occur.

Have a look at the function `window-splittable-p' if you want to
know how `split-window-sensibly' determines whether WINDOW can be
split.

This function was a copy of the emacs/lisp/window.el `split-window-sensibly'
from version ~27.0.5"
  (let ((window (or window (selected-window))))
    (or
     (and
         ;; check vertical
         (window-splittable-p window)
	     ;; Split window vertically.
	     (with-selected-window window
	       (split-window-below)))
	 (and
         ;; check horizontal
         (window-splittable-p window t)
	     ;; Split window horizontally.
	     (with-selected-window window
	       (split-window-right)))
	 (and
         ;; If WINDOW is the only usable window on its frame (it is
         ;; the only one or, not being the only one, all the other
         ;; ones are dedicated) and is not the minibuffer window, try
         ;; to split it vertically disregarding the value of
         ;; `split-height-threshold'.
         (let ((frame (window-frame window)))
           (or
            (eq window (frame-root-window frame))
            (catch 'done
              (walk-window-tree (lambda (w)
                                  (unless (or (eq w window)
                                              (window-dedicated-p w))
                                    (throw 'done nil)))
                                frame)
              t)))
	     (not (window-minibuffer-p window))
	     (let ((split-height-threshold 0))
	       (when (window-splittable-p window)
	         (with-selected-window window
	           (split-window-below))))))))

(defun split-window-sensibly-prefer-right-default-below (&optional window)
    "A modified version of `split-window-sensibly' that will try to split
to the right first, before trying to split below.  If neither is possible,
it will default to splitting below.

You can enforce this function to not split WINDOW horizontally,
by setting (or binding) the variable `split-width-threshold' to
nil.  If, in addition, you set `split-height-threshold' to zero,
chances increase that this function does split WINDOW vertically.

In order to not split WINDOW vertically, set (or bind) the
variable `split-height-threshold' to nil.  Additionally, you can
set `split-width-threshold' to zero to make a horizontal split
more likely to occur.

Have a look at the function `window-splittable-p' if you want to
know how `split-window-sensibly' determines whether WINDOW can be
split.

This function was a copy of the emacs/lisp/window.el `split-window-sensibly'
from version ~27.0.5"
  (let ((window (or window (selected-window))))
    (or
	 (and
         ;; check horizontal
         (window-splittable-p window t)         
	     ;; Split window horizontally.
	     (with-selected-window window
	       (split-window-right)))
     (and
         ;; check vertical
         (window-splittable-p window)
	     ;; Split window vertically.
	     (with-selected-window window
	       (split-window-below)))
	 (and
         ;; If WINDOW is the only usable window on its frame (it is
         ;; the only one or, not being the only one, all the other
         ;; ones are dedicated) and is not the minibuffer window, try
         ;; to split it vertically disregarding the value of
         ;; `split-height-threshold'.
         (let ((frame (window-frame window)))
           (or
            (eq window (frame-root-window frame))
            (catch 'done
              (walk-window-tree (lambda (w)
                                  (unless (or (eq w window)
                                              (window-dedicated-p w))
                                    (throw 'done nil)))
                                frame)
              t)))
	     (not (window-minibuffer-p window))
	     (let ((split-height-threshold 0))
	       (when (window-splittable-p window)
	         (with-selected-window window
	           (split-window-below))))))))

(defun split-window-sensibly-prefer-right-default-right (&optional window)
    "A modified version of `split-window-sensibly' that will try to split
to the right first, before trying to split below.  If neither is possible,
it will default to splitting right.

You can enforce this function to not split WINDOW horizontally,
by setting (or binding) the variable `split-width-threshold' to
nil.  If, in addition, you set `split-height-threshold' to zero,
chances increase that this function does split WINDOW vertically.

In order to not split WINDOW vertically, set (or bind) the
variable `split-height-threshold' to nil.  Additionally, you can
set `split-width-threshold' to zero to make a horizontal split
more likely to occur.

Have a look at the function `window-splittable-p' if you want to
know how `split-window-sensibly' determines whether WINDOW can be
split.

This function was a copy of the emacs/lisp/window.el `split-window-sensibly'
from version ~27.0.5"
  (let ((window (or window (selected-window))))
    (or
	 (and
         ;; Check horizontal
         (window-splittable-p window t)
	     ;; Split window horizontally.
	     (with-selected-window window
	       (split-window-right)))
     (and
         ;; Check vertical
         (window-splittable-p window)
	     ;; Split window vertically.
	     (with-selected-window window
	       (split-window-below)))
	 (and
         ;; If WINDOW is the only usable window on its frame (it is
         ;; the only one or, not being the only one, all the other
         ;; ones are dedicated) and is not the minibuffer window, try
         ;; to split it horizontally disregarding the value of
         ;; `split-width-threshold'.
         (let ((frame (window-frame window)))
           (or
            (eq window (frame-root-window frame))
            (catch 'done
              (walk-window-tree (lambda (w)
                                  (unless (or (eq w window)
                                              (window-dedicated-p w))
                                    (throw 'done nil)))
                                frame)
              t)))
	     (not (window-minibuffer-p window))
	     (let ((split-width-threshold 0))
	       (when (window-splittable-p window)
	         (with-selected-window window
	           (split-window-right))))))))

(defun split-window-sensibly-prefer-below-default-right (&optional window)
    "A modified version of `split-window-sensibly' that will try to split
below fist, before trying to split to the right.  If neither is possible,
it will default to splitting right.

You can enforce this function to not split WINDOW horizontally,
by setting (or binding) the variable `split-width-threshold' to
nil.  If, in addition, you set `split-height-threshold' to zero,
chances increase that this function does split WINDOW vertically.

In order to not split WINDOW vertically, set (or bind) the
variable `split-height-threshold' to nil.  Additionally, you can
set `split-width-threshold' to zero to make a horizontal split
more likely to occur.

Have a look at the function `window-splittable-p' if you want to
know how `split-window-sensibly' determines whether WINDOW can be
split.

This function was a copy of the emacs/lisp/window.el `split-window-sensibly'
from version ~27.0.5"
  (let ((window (or window (selected-window))))
    (or
     (and
         ;; Check vertical
         (window-splittable-p window)
	     ;; Split window vertically.
	     (with-selected-window window
	       (split-window-below)))
	 (and
         ;; Check horizontal
         (window-splittable-p window t)
	     ;; Split window horizontally.
	     (with-selected-window window
	       (split-window-right)))
	 (and
         ;; If WINDOW is the only usable window on its frame (it is
         ;; the only one or, not being the only one, all the other
         ;; ones are dedicated) and is not the minibuffer window, try
         ;; to split it horizontally disregarding the value of
         ;; `split-width-threshold'.
         (let ((frame (window-frame window)))
           (or
            (eq window (frame-root-window frame))
            (catch 'done
              (walk-window-tree (lambda (w)
                                  (unless (or (eq w window)
                                              (window-dedicated-p w))
                                    (throw 'done nil)))
                                frame)
              t)))
	     (not (window-minibuffer-p window))
	     (let ((split-width-threshold 0))
	       (when (window-splittable-p window)
	         (with-selected-window window
	           (split-window-right))))))))

(provide 'split-window-sensibly-prefer-right-default-below)
(provide 'split-window-sensibly-prefer-right-default-right)
(provide 'split-window-sensibly-prefer-below-default-right)
(provide 'split-window-sensibly-prefer-below-default-below)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; If either of these is set to nil, that type of split will never automatically be created
;; and will only be used if it's the default and we have no other option.  These are the minimum
;; sizes allowed when checking if automatic splitting is ok.
(setq split-height-threshold 10)
(setq split-width-threshold 80)

;; set this nil so it will try to keep the text the same between the windows rather than trying
;; to keep the point in both windows.  When splitting below, this should result in the same
;; text appearing with a dividing line in the middle.  The focus is the window that would still have
;; the cursor in it.
(setq split-window-keep-point nil)

;(setq split-window-preferred-function 'my-split-window-sensibly)
(setq split-window-preferred-function 'split-window-sensibly-prefer-right-default-below)
