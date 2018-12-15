;; Guesses at whether indenting is tab or space-based, the size of tabs, and/or the number of spaces per indent level

;; This package isn't available thru melpa, it's from source here: https://github.com/nschum/guess-style
;; We can't use the use-package as a result since it doesn't load anything correctly

; define the functions that can be called
(autoload 'guess-style-set-variable "guess-style" nil t)
(autoload 'guess-style-guess-variable "guess-style")
(autoload 'guess-style-guess-all "guess-style" nil t)
(autoload 'guess-style-guess-tabs-mode "guess-style" nil t)
(autoload 'guess-style-guess-tab-width "guess-style" nil t)

; add hooks for these formats
(add-hook 'c-mode-common-hook 'guess-style-guess-all)
(add-hook 'cperl-mode-hook 'guess-style-guess-all)
(add-hook 'lua-mode-hook 'guess-style-guess-all)
; python already has an auto-indent mode that doesn't play nice
(add-hook 'python-mode-hook 'guess-style-guess-all)
