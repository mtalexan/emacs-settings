;; Shows real-time replacements based on regex

(use-package visual-regexp
  ; get it from package.el
  :ensure t
  :commands (
     vr/replace
     vr/query-replace
     vr/mc-mark ; requires multiple-cursors
    )
  :init
    (require 'visual-regexp)
  :config
    ; always show help for keys available in the minibuffer during replace when non-nil
    (setq vr/auto-show-help t)

    ; Limit the number of visual feedback items shown, default=50, unlimited=nil
    (setq vr/default-feedback-limit nil)

    ; preview of replacement activated by default? If activated, original not shown alongside replacement
    ; default=nil
    (setq vr/default-replace-preview 100)

    ; if set, works like plain search/replace instead of regex.  Default=nil
    (setq vr/plain nil)

  :bind (
    ;remap from replace-regex "C-M-%" to vr/replace
    ([remap replace-regex] . vr/replace)
    ; remap from query-replace-regex "M-%"to vr/query-replace
    ([remap query-replace-regex] . vr/query-replace)
    ); bind
  )
