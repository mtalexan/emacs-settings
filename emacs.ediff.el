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
