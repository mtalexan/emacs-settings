;; Buffer Switching mode

; a native package.
;Has two types of marks, Deletion marks and regular Marks.
; Can change filtering of files listed.
; Reached with ivy-occur from ivy-switch-buffer/counsel-ibuffer
(use-package ibuffer
  :commands (
             ibuffer-mode
             ibuffer-mode-map
   ) ; end :commands
  :config

  :bind (
     ;; used with ivy-occur on ivy-switch-buffer results
     :map ibuffer-mode-map
       ;; defaults
       ("m" . ibuffer-mark-forward)
       ("t" . ibuffer-toggle-marks)
       ("u" . ibuffer-unmark-forward)
       ("=" . ibuffer-diff-with-file)
       ("j" . ibuffer-jump-to-buffer)
       ("* *" . ibuffer-unmark-all)
       ("d" . ibuffer-mark-for-delete)
       ("k" . ibuffer-mark-for-delete)
       ("x" . ibuffer-do-kill-on-deletion-marks) ; kills at point unless deletion marks
       ("q" . ibuffer-quit)
       ("h" . ibuffer-help)
       ("?" . ibuffer-help)
       ;; default operations on previously marked buffers
       ("A" . ibuffer-do-view)
       ("D" . ibuffer-do-delete)
       ("R" . ibuffer-do-rename-uniquely)
       ("S" . ibuffer-do-save)
       ("V" . ibuffer-do-revert)

       ;; newly added
       ("K" . ibuffer-do-delete) 
   ) ;end of :bind
  ) ; end of use-package




