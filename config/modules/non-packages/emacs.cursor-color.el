;; Cursor Color Fix
;; For some reason the cursor color only seems to be set when a frame 
;; is initially created, rather than whenever it gains focus.  This
;; means changing between different colored frames that require light-vs-dark
;; cursors because of their background colors is screwed.
;; Notably, with auto complete enabled it creates a new mini-frame with a light
;; background and sets the cursor color to a black.  The result is that when the
;; auto complete closes it will return to the dark background frame you're working
;; in with the cursor still set to black and therefore invisible

(require 'frame)
(defun frame-bg (frame)
  "Custom behaviours for new frames."
  (with-selected-frame frame
    (set-cursor-color "#ffffff")
    ))
(frame-bg (selected-frame))
(add-hook 'after-make-frame-functions 'frame-bg)
