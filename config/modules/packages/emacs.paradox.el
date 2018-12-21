;; Replaces the crappy default package manager with paradox so opening the
;; list-packages doesn't lockup the UI forever

(use-package paradox
  ; get it from package.el
  :ensure t
  :commands (
             paradox-mode
             paradox-enable
   )
  :init
    ; always enable for list-packages by default
    (paradox-enable)
  )

