;; Adds some git commands to emacs.  Specifically useful for file blame mode.

;; This package is included in Emacs 24.x by default
(use-package egg
  :ensure t
  :commands (
             egg-minor-mode
   )
  :init
    (setq egg-mode-key-prefix "C-x g")
    (egg-minor-mode 1)
  :config
   (setq egg-cmd-select-special-buffer t)
   (setq egg-commit-file-select-mark 9654)
   (setq egg-enable-tooltip t)
   (setq egg-git-diff-file-options-alist
         (quote
          ((c-mode "--patience")
           (emacs-lisp-mode "--patience" "--ignore-all-space")
           (text-mode "--histogram")
           (makefile-mode "--patience"))))
   (setq egg-log-buffer-marks
         "\342\234\224\342\234\216\342\226\274\342\227\217\342\232\222")
   (setq egg-log-graph-chars
         "\342\227\217\342\224\202\342\224\200\342\225\261\342\225\262")
   (setq egg-max-reflogs 30)
   (setq egg-refresh-index-in-backround t)
   (setq egg-show-key-help-in-buffers
         (quote
          (:status :log :diff :commit :query :stash)))
   (setq egg-status-buffer-sections
         (quote
          (repo staged unstaged untracked)))
  )

