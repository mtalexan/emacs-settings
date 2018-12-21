;; Gets the available company completion package

(use-package company-lua
  :ensure t
  :after (
          company
          )
  :requires company
  :init
    (add-to-list 'company-backends 'company-lua)
  )

