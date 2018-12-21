;; Makes speedbar open in small side window within the same frame instead of in a different frame
;; Speedbar is basically the directory heirarchy

(use-package sr-speedbar
  :ensure t
  :commands (
             sr-speedbar-open
             sr-speedbar-select-window
             )
  ;; Auto-open in C and C++ modes
  :hook ( (c++-mode c-mode) . sr-speedbar-open)
  :init
  :config
    ;;set default and max widths
    (setq sr-speedbar-default-width 15)
    (setq sr-speedbar-max-width 3)
    ;; on the left
    (setq sr-speedbar-right-side nil)
    ;; Disable skipping the speedbar when moving between windows
    (setq sr-speedbar-skip-other-window-p nil)
    ;; don't use image icons
    (setq speedbar-use-images nil)
    :bind (
           ;; Remap the select other-window "M-9" command to use the sr-speedbar version
           ([remap other-frame] . sr-speedbar-select-window)
     )
  )







