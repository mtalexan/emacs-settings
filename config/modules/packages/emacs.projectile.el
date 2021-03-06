;; Project management tool

(use-package projectile
  :ensure t
  :commands (
    if-projectile-projectile-compile-project-or-compile
    if-projectile-projectile-grep-or-rgrep
    projectile-find-other-file
  ) ; end of :commands
  :init
    ;; enable it to work everywhere, even outside projectile projects
    (projectile-global-mode)
  :config
    (setq projectile-enable-caching t)

    ;; Some functions for conditional projectile commands
    (defun if-projectile-projectile-compile-project-or-compile ()
      "Determines based on the current buffer whether within a projectile project or not.
       If within a projectile project, the function `projectile-compile-project' is used, 
       otherwise the function `compile' is used.
       Using the non-projectile function can be forced by preceeding the command with \\[universal-argument].
      "
      (interactive)
      (call-interactively
       (if (and (projectile-project-p) (equal current-prefix-arg nil))
           'projectile-compile-project
         'compile
         )
       )
      )

    (defun if-projectile-projectile-grep-or-rgrep ()
      "Determines based on the current buffer whether within a projectile project or not.
       If within a projectile project, the function `projectile-grep' is used, otherwise the
       function `rgrep' is used.  
       Using the non-projectile function can be forced by preceeding the command with \\[universal-argument].
      "
      (interactive)
      (call-interactively
       (if (and (projectile-project-p) (equal current-prefix-arg nil))
           'projectile-grep
         'rgrep
         )
       )
      )
    (provide 'if-projectile-projectile-grep-or-rgrep)
  :bind (
    ;; re-define the compile command to automatically perform it on the projectile project
    ;; when we're in projectile projects.
    ([remap compile] . if-projectile-projectile-compile-project-or-compile)
    ([remap rgrep] . if-projectile-projectile-grep-or-rgrep)

    ("C-c h" . projectile-find-other-file)
   )
  )
