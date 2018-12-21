;; Allows fuzzy matching using the flx engine on company completions

(use-package company-flx
  :ensure t
  :requires company
  :after (
          company
          )
  :init
    (company-flx-mode +1)
  )
