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

(provide 'unpop-to-mark-command)
(global-set-key (kbd "C-<") 'pop-to-mark-command)
(global-set-key (kbd "C->") 'unpop-to-mark-command)
