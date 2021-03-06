;; Built-in syntax parser and analyzer for fancy C support

;; This package is included in Emacs by default
(use-package semantic
  ;; part of emacs now, causes errors if we do ensure t on them
  ;;:ensure t
  :commands (
    semantic-mode
    my-semantic-parse-dir
    my-semantic-parse-current-dir
    lk-parse-durdir-c
    lk-parse-dir-c
    semantic-projectile-parse-project
    projectile-semantic-parse-project
    ) ; end :commands
  ;; always enable for c and c++ modes
  :hook ( (c++-mode c-mode) . semantic-mode)
  :init
  :config
    ;; set the global modes for these always
    (setq global-semantic-decoration-mode nil)
    (setq global-semantic-highlight-edits-mode nil)
    (setq global-semantic-highlight-func-mode t)
    (setq global-semantic-idle-breadcrumbs-mode '(t nil (semantic/idle)))
    (setq global-semantic-idle-completions-mode '(nil nil (semantic/idle)))
    (setq global-semantic-idle-summary-mode nil)
    (setq global-semantic-mru-bookmark-mode t)
    (setq global-semantic-show-parser-state-mode t)
    (setq global-semantic-show-unmatched-syntax-mode nil)
    (setq global-semantic-stickyfunc-mode t)
    (setq global-semanticdb-minor-mode nil)

    (setq semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-tooltip))
    (setq semantic-complete-inline-analyzer-idle-displayor-class (quote semantic-displayor-tooltip))
    (setq semantic-completion-displayor-format-tag-function (quote semantic-format-tag-prototype))
    (setq semantic-decoration-styles
         (quote
          (("semantic-decoration-on-includes")
           ("semantic-decoration-on-includes")
           ("semantic-decoration-on-protected-members" . t)
           ("semantic-decoration-on-private-members" . t)
           ("semantic-tag-boundary" . t))))
    (setq semantic-default-submodes
          (quote
           (global-semantic-highlight-func-mode
            global-semantic-stickyfunc-mode
            global-semantic-idle-scheduler-mode
            global-semantic-idle-local-symbol-highlight-mode)))
    (setq semantic-idle-breadcrumbs-display-function (quote semantic-idle-breadcrumbs--display-in-header-line))
    (setq semantic-idle-scheduler-work-idle-time 30)
    (setq semantic-idle-work-parse-neighboring-files-flag t)
    (setq semantic-idle-work-update-headers-flag t)
    (setq semantic-imenu-auto-rebuild-directory-indexes t)
    (setq semantic-imenu-index-directory t)
    (setq semantic-imenu-sort-bucket-function (quote semantic-sort-tags-by-name-increasing-ci))
    (setq semantic-imenu-summary-function (quote semantic-format-tag-prototype))
    (setq semantic-mode t)
    (setq semantic-symref-auto-expand-results nil)
    (setq semantic-update-mode-line '(nil nil (semantic/util-modes)))
    (setq semantic-which-function-use-color t)
    (setq semanticdb-default-save-directory (projectile-project-root))
    (setq semanticdb-ebrowse-file-match "\\.\\(hh?\\|HH?\\|hpp\\)")
    (setq semanticdb-find-default-throttle
          (quote
           (local
            project
            unloaded
            system
            recursive
            omniscience)))
    (setq semanticdb-persistent-path (quote (project)))

    ;; Semantic relies on EDE to provide the file list it needs to support.  EDE is retarded and doesn't
    ;; work right, especially on C++.  Someone wrote a fix that will recursively parse all files in all 
    ;; sub-directories.
    (defvar c-files-regex ".*\\.\\(c\\|cpp\\|h\\|hpp\\)$"
      "A regular expression to match any c/c++ related files under a directory")

    (defvar c-files-exclude-regex ".*_moc\\..*$"
      "A regular expression to match moc files that shouldn't be parsed")

    (defun my-semantic-parse-dir (root regex regex-no)
      "
       This function is an attempt of mine to force semantic to
       parse all source files under a root directory. Arguments:
       -- root: The full path to the root directory
       -- regex: A regular expression against which to match all files in the directory
       -- regex-no: A regular expression that when matched will cause a file to be skipped
      "
      (let (
            ;;make sure that root has a trailing slash and is a dir
            (root (file-name-as-directory root))
            (files (directory-files root t ))
           )
        ;; remove current dir and parent dir from list
        (setq files (delete (format "%s." root) files))
        (setq files (delete (format "%s.." root) files))
        (setq files (delete (format "%s.git" root) files))
        ;add any other directories in the root path that need to be ignored
        (while files
          (setq file (pop files))
          (if (not (file-symlink-p file))
            ;it's not a symlink (we ignore those to prevent infinite loops)
            (if (file-accessible-directory-p file)
              ;;it's a directory
              (my-semantic-parse-dir file regex regex-no)
              ;;else it's not a directory
              (progn
                ;;if it's a file that matches the regex but not the regex-no
                (when (and (string-match-p regex file)
                                (not (string-match-p regex-no file)))
                   (save-excursion
                     (semanticdb-file-table-object file))
                   )
                )
              )
            )
         )
      )
    )

    (defun my-semantic-parse-current-dir (regex regex-no)
      "
       Parses all files under the current directory matching regex
      "
      (my-semantic-parse-dir (file-name-directory(buffer-file-name)) regex regex-no)
      (semanticdb-save-all-db) ;force save the db between directories so we handle big trees
    )

    (defun lk-parse-curdir-c ()
      "
       Parses all the c/c++ related files under the current directory
       and inputs their data into semantic
      "
      (interactive)
      (my-semantic-parse-current-dir c-files-regex c-files-exclude-regex)
    )

    (defun lk-parse-dir-c (dir)
      "Prompts the user for a directory and parses all c/c++ related files
       under the directory
      "
      (interactive (list (read-directory-name "Provide the directory to search in:")))
      (my-semantic-parse-dir (expand-file-name dir) c-files-regex c-files-exclude-regex)
    )

    (defun semantic-projectile-parse-project ()
      "Automatically does a lookup using projectile to find the current project root and then parses all
       files in all subdirectories that match the c-files-regex but not the c-files-exclude-regex.
       WARNING: This is VERY slow, only do it if you plan on waiting a while.
      "
      (if (not (projectile-project-root))
        (error "Projectile project root is not set")
        (lk-parse-dir-c (projectile-project-root))
      )
    )
    (defun projectile-semantic-parse-project ()
      "Wrapper to semantic-projectile-parse-project"
      (semantic-projectile-parse-project)
      )

    (provide 'lk-file-search)
 )

