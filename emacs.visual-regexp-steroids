;; Shows real-time replacements based on regex, advanced regex support


; Requires Python!
(use-package visual-regexp-steroids
  ; only if we have viaul-regexp
  :requires visual-regexp
  ; only if we have python available on the system
  :if (executable-find "python")
  ; get it from package.el
  :ensure t
  :after (
      visual-regexp
    )
  :commands (
      vr/replace
      vr/query-replace
      vr/mc-mark ; requires multiple-cursors
    )
  :init
   (require 'visual-regexp-steroids)
  :config

    ; always show help for keys available in the minibuffer during replace when non-nil
    (setq vr/auto-show-help t)

    ; Limit the number of visual feedback items shown, default=50, unlimited=nil
    (setq vr/default-feedback-limit 100)

    ; preview of replacement activated by default? If activated, original not shown alongside replacement
    ; default=nil
    (setq vr/default-replace-preview nil)

    ; if set, works like plain search/replace instead of regex.  Default=nil
    (setq vr/plain nil)

    ; Set the engine type to use: emacs, pcre2el, python (default), custom
    (setq vr/engine 'python)

    ; how to call python for the regex parsing. Default="python"
    ;(setq vr/command-python 'python)

    ; Regex Modifiers, I=ignorecase M=multiline(^ and $ match on every line), S=dotall (dot matches newline), U=Unicode
    (setq vr/default-regexp-modifiers '(:I nil :M t :S nil :U nil))

  :bind (
    ;remap from replace-regex "C-M-%" to vr/replace
    ([remap replace-regex] . vr/replace)
    ; remap from query-replace-regex "M-%" to vr/query-replace
    ([remap query-replace-regex] . vr/query-replace)
    ); bind
  )
