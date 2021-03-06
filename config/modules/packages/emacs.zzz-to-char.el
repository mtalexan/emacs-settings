;; zap-to-char replacement that uses avy when multi-match on the line and handles both forward and back

(use-package zzz-to-char
  :ensure t
  :after (
     avy
   )
  :commands (
     zzz-to-char
     zzz-up-to-char
   ) ; end :commands
  :config
    ;; maximum number of characters to zap from point.  Default=80
    (setq zzz-to-char-reach 120)
  :bind (
      ("M-z" . zzz-up-to-char)
    ) ;end of :bind
  ) ; end of use-package
