;; Company is an auto-completion tool that can use various backends to retrieve possible completions
;; It's significantly better maintained than auto-complete, which is one of the main alternatives


(use-package company
  ;get it from package.el if necessary
  :ensure t
  :commands (
    company-mode
    company-complete
    )
  ; Add company-mode to the mode hooks for the list of modes given
  :hook (
      ((lisp-mode c-mode-common perl-mode python-mode lua-mode sh-mode makefile-mode emacs-list-mode) . company-mode)
    )
  :init
    (setq company-global-modes t)
  :config
    ; How to trigger an autocomplete to be used
    (setq company-auto-complete 'company-explicit-action-p)
    ; No specific autocomplete characters
    (setq company-auto-complete-chars 'ignore)
    ; Where to get completion candidates from
    (setq company-backends
          (quote
           ((company-gtags
             company-dabbrev-code
             company-keywords
             company-files))))
    ; How to display the possible completions
    (setq company-frontends
          (quote
           (company-pseudo-tooltip-frontend
            company-echo-metadata-frontend
            company-preview-frontend)))
    ; Use dabbrev always
    (setq company-dabbrev-code-everywhere t)
    ; Use dabbrev in these modes
    (setq company-dabbrev-code-modes
          (quote
           (prog-mode
            batch-file-mode
            python-mode
            c++-mode
            c-mode
            java-mode)))
    ; parse other buffers to populate dabbrev list
    (setq company-dabbrev-code-other-buffers t)

    ; Don't allow company when completion is too short
    (setq company-abort-manual-when-too-short t)
    ; Automatically add arguments when completing to functions from gtags
    (setq company-gtags-insert-arguments t)
    ; modes to use company gtags in
    (setq company-gtags-modes
          (quote
           (prog-mode
            c++-mode
            c-mode
            java-mode)))
    ; Delay before autocomplete pops up
    (setq company-idle-delay 0.2)
    ; When going through completion list, should cursor wrap
    (setq company-selection-wrap-around t)
    ; How to sort completion candidates
    (setq company-transformers (quote (company-sort-by-backend-importance)))
    ; How to display the completion candidates
    (setq completions-format (quote vertical))
  :bind (
    ("M-'" . company-complete)

    :map company-active-map
    ([tab] . nil)
    ([spc] . nil)
   )
)
