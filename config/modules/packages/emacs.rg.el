;; An interface to rg (ripgrep), which performs a more efficient rgrep

;; Only if rg is available on the system
(if (not (executable-find "rg"))
    (warn "Not using ripgrep since unavailable on the system"))

;; enables wgrep just for use here.  If already listed, this does nothing
(use-package wgrep
  ;; only if the rg executable is present
  :if (executable-find "rg")
  :ensure t
  :commands (
             wgrep-ag-setup
     )
  ;; required for the rg mode to work right
  :hook ((rg-mode . wgrep-ag-setup))
  )

(use-package rg
  ;; only if the rg executable is present
  :if (executable-find "rg")
  :ensure t
  :commands (
             rg
             rg-project
             rg-dwim
             rg-literal
             rg-save-search
             rg-save-search-as-name
             rg-list-searches
             rg-enable-default-bindings
             rg-kill-saved-searches
             ) ; end :commands
  :init
    ;; to get default keybindings under a prefix, use the following
    ;(rg-enable-default-bindings "\M-s")

  :config
     ;; wgrep installed from package.el doesn't seem to include wgrep-ag
     ;; so we pull from the submodule instead
     (autoload 'wgrep-ag-setup
       (concat user-emacs-directory (convert-standard-filename "wgrep/wgrep-ag")))

     ;; set additional custom type aliases here
     ;(setq rg-custom-type-aliases
     ;    '(("foo" . "*.foo *.bar")
     ;      ("baz" . "*.baz *.qux")))

     ;; for any additional command line flags
     ;(setq rg-command-line-flags ("" "" ""))

     ;; non-nil puts a file heading, then all matches for the file
     ;; nil puts one result per line, prefaced with filename
     (setq rg-group-result t)

     ;; if column numbers for matches should be included in results
     (setq rg-show-columns nil)

     ;; indicate when case sensitivity should be used
     ;;  'case-fold-search based on case-fold-search setting
     ;;  'smart uses the smart-case setting of ripgrep, depending on whether uppercase appears in the search
     ;;  'force always ignore case
     ;;  nil never ignore case
     (setq rg-ignore-case nil)

     ;; set nil to always show full rg command in minibuffer
     (setq rg-hide-command t)

     ;; set nil if the header output in the buffer should be removed
     (setq rg-show-header t)

     ;; Define a new toggle setting key for use in the ripgrep buffers.
     ;; final argument is t or nil to select on-by-default
     (rg-define-toggle "--hidden" "h" nil)
     (rg-define-toggle "--follow" "F" nil)
     (rg-define-toggle "--word-regexp" "w" nil)

  :bind (
      ;; instead of using default keybindings, write over the rgrep option
      ("M-f" . rg)
      ("M-F" . rg-list-searches)
    ) ;end of :bind
)
