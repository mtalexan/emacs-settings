;; Interfaces to cscope by checking cscope files in different directories, possibly multiple cscope
;; files.  Lists results of search in a buffer with selectable locations.

;; This requires the CSCOPE tool from the system!!!
(when (not (executable-find "cscope"))
  (warn "Unable to find required tool cscope")
  )

(use-package xcscope
  ;; only load it if we have the tool
  :if (executable-find "cscope")
  :ensure t
  :commands (
    cscope-find-this-symbol
    cscope-find-global-definitions
    cscope-file-functions-calling-this-function
    cscope-pop-mark
    ) ; end :commands
  :config
    ;;when indexing, index to file not location indexing was run from
    (setq cscope-use-relative-paths 1)

    ;;Prevent the database from being updated
    (setq cscope-do-not-update-database 1)

    ;;Don't automatically go to match if there's only one
    (setq cscope-edit-single-match nil)

    ;;Don't show search time
    ;(setq cscope-display_times nil)

    ;;Don't show empty matches
    ;(setq cscope-suppress-empty-matches 1)

    ;;doesn't show buffer by default if turned on (default is true)
    ;(setq cscope-display-cscope-buffer nil)

    ;; The following sets up the search paths for the 
    ;; cscope.out file based on the file in the current
    ;; buffer.  The format is 
    ;; '( (REGEX (PATH1) (PATH2)) (REGEX (PATH1) (PATH2)) )
    ;; If the regex matches the file in the current buffer,
    ;; the paths are searched in order.  Specifying ( t )
    ;; as the path means it will search each directory
    ;; starting from the current one and moving upward till
    ;; root is reached for a cscope.out file.  If none is
    ;; is found or the stop at single database flag isn't
    ;; set it will continue working through the search paths.
    ;; Optionally a "path" can be set that triggers a cscope
    ;; run, but if the stop at single database flag isn't set
    ;; it will always run the cscope command (slow).
    ;; NOTE: cscope can not resolve the ~ symbol to the home
    ;;       directory, so it cannot be used in the paths
    ;;       specified here.
    ;; NOTE: If a path cannot be found, the search stops 
    ;;       immediately and will fail to process any further 
    ;;       entries.  Be sure to use existing directories 
    ;;       as the path rather than specifying files that 
    ;;       might or might not exist.
    ;; NOTE: Individual files don't work very well in this
    ;;       list, so if the files aren't named according to
    ;;       the default name specified in the settings,
    ;;       it seems to be hit or miss whether it finds the
    ;;       file at all, and if it doesn't find the file
    ;;       it stops looking for any more files.
    (setq cscope-database-regexps 
      '(
         (".*"
           ( t )
           t      ;; stop here if matches are found
           ;( "${HOME}/modular/" )
           ;( "${HOME}/rrsdk/ksi/" )
           ;t      ;; stop here if matches are found
           ;( "${HOME}/emacs_tags/modular/" )
           ;( "${HOME}/emacs_tags/OR1BusDev/" )
           ;( "${HOME}/emacs_tags/rrsdk/" )
           ;t      ;; stop here if matches are found
           ;( "${HOME}/emacs_tags/everything/" )
          )
        )
      )

  :bind (
    ;; Setup some cscope key bindings for quick access
    ("C-M-." . cscope-find-this-symbol)
    ("C-." . cscope-find-global-definition)
    ("C-/" . cscope-find-functions-calling-this-function)
    ("C-," . cscope-pop-mark)

    :map cscope-list-entry-keymap
      ;; Ergo
      ("M-k" . nil)
      ("M-K" . nil)
      ("M-i" . nil)
      ("M-I" . nil)
      ("M-l" . nil)
      ("M-L" . nil)
      ("M-j" . nil)
      ("M-J" . nil)
      ("M-o" . nil)
      ("M-u" . nil)
      ;; drop unused keys
      ("A" . nil)
      ("C" . nil)
      ("D" . nil)
      ("E" . nil)
      ("G" . nil)
      ("I" . nil)
      ("L" . nil)
      ("W" . nil)
      ("a" . nil)
      ("c" . nil)
      ("d" . nil)
      ("e" . nil)
      ("f" . nil)
      ("f" . nil)
      ("i" . nil)
      ("k" . nil)
      ("o" . nil)
      ("r" . nil)
      ("s" . nil)
      ("t" . nil)
      ("u" . nil)
      ;; jump results instead of just single lines
      ("n" . cscope-history-forward-result)
      ("p" . cscope-history-backward-result)
      ;; reverse these so lowercase is jump to result and uppercase is jump to file
      ("M-n" . cscope-history-forward-result)
      ("M-p" . cscope-history-backward-result)
      ("M-N" . cscope-history-forward-file)
      ("M-P" . cscope-history-backward-file)
    ) ; end :bind
  )

