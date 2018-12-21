;; Makes past marks visible with an outline

(use-package visible-mark
  :ensure t
  :init
    ;; Enable global mode (always enabled)
    (global-visible-mark-mode t)
  :config
    ;; set faces to use for marks behind and forward from where we are in the mark list
    (setq visible-mark-faces (quote (visible-mark-forward-face2)))
    (setq visible-mark-forward-faces (quote (visible-mark-forward-face2)))
    ;; maximum number of faces ahead of us in the mark list
    (setq visible-mark-forward-max 5)
    (setq visible-mark-inhibit-trailing-overlay t)
    ;; only the last 5 marks are visible (though the mark list might be much longer)
    (setq visible-mark-max 5)
    ;; set faces for reference use above
    (set-face-attribute 'visible-mark-face1 nil :box '(:line-width 1 :color "light salmon"))
    (set-face-attribute 'visible-mark-face2 nil :box '(:line-width 1 :color "light goldenrod"))
    (set-face-attribute 'visible-mark-forward-face1 nil :box '(:line-width 1 :color "pale green"))
    (set-face-attribute 'visible-mark-forward-face2 nil :box '(:line-width 1 :color "grey40"))
  )
