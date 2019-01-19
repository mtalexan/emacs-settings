;; Gets the available company completion package

(use-package company-shell
  :ensure t
  :after (
          company
          )
  :requires company
  :init
    (add-to-list 'company-backends 'company-shell)
  )

