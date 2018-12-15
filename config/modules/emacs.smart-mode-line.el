;; Clean looking mode line adjuster

(use-package smart-mode-line
  ; get it from package.el
  :ensure t
  :init
  :config
    ;customize with the M-x command "sml/customize", otherwise it's all setup here

    ;fixed 5 digit wide line number
    (setq sml/line-number-format "%5l")
    ; put the modes on the right side
    (setq sml/mode-width (quote right))
    ;fixed 3 digit wide percentage
    (setq sml/position-percentage-format "%3p")
    (setq sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
    ;use cleaner names for the following format lines
    (setq sml/replacer-regexp-list
      (quote
       (("^~/org" ":Org:")
        ("^~/\\.emacs\\.d/" ":ED:")
        ("^/sudo:.*:" ":SU:")
        ("^~/Documents/" ":Doc:")
        ("^~/Dropbox/" ":DB:")
        ("^:\\([^:]*\\):Documento?s/" ":\\1/Doc:")
        ("^~/[Gg]it/" ":Git:")
        ("^~/[Gg]it[Hh]ub/" ":Git:")
        ("^~/[Gg]it\\([Hh]ub\\|\\)-?[Pp]rojects/" ":Git:")
        ("^~/modular_code_repos/\\(.*\\)\\(/modular/\\)?" ":\\1:")
        ("^~/rrsdk_code_repos/\\([^/]*\\)\\(/rrsdk/ksi/\\)?" ":\\1:")
        ("^~/msdk_code_repos/\\([^/]*\\)" ":\\1:"))))
    (setq sml/theme (quote dark))
    ;show if we're in a git controlled file
    (setq sml/vc-mode-show-backend nil)

    ;set faces
    (set-face-attribute 'sml/folder nil :inherit 'sml/global :background "grey22" :foreground "forest green" :weight 'normal)
    (set-face-attribute 'sml/minor-modes nil :foreground "dark goldenrod")
    (set-face-attribute 'sml/modes nil :inherit 'sml/global :background "grey40" :foreground "olive drab")

    ; MUST be last
    (sml/setup)
  ) ; end of use-package




