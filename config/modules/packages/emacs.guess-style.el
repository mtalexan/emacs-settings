;; Guesses at whether indenting is tab or space-based, the size of tabs, and/or the number of spaces per indent level


;; This package isn't available thru melpa, it's from source here: https://github.com/nschum/guess-style
;; We therefore need to make sure the main file, guess-style.el or
;; guess-style.elc, is in the load-path
(use-package guess-style
  :after (
      cperl-mode
      lua-mode
      python
      cc-mode
  )
  :commands (
      guess-style-set-variable
      guess-style-guess-variable
      guess-style-guess-all
      guess-style-guess-tabs-mode
      guess-style-guess-tab-width
  )
  :init
      ;; add hooks for these formats
      (add-hook 'c-mode-common-hook 'guess-style-guess-all)
      (add-hook 'cperl-mode-hook 'guess-style-guess-all)
      (add-hook 'lua-mode-hook 'guess-style-guess-all)
      ;; python already has an auto-indent mode that doesn't play nice
      (add-hook 'python-mode-hook 'guess-style-guess-all)
)
