;; Adds support for automatically doing clearcase commands

(use-package clearcase
  :ensure t
  :commands (
             clearcase
             clearcase-checkout-current-buffer
             clearcase-checkin-current-buffer
             clearcase-ediff-pred-current-buffer
             clearcase-find-checkouts-in-current-view
             clearcase-edcs-edit
             clearcase-mkelem-current-buffer
             clearcase-uncheckout-current-buffer
             clearcase-command-mode-map
   ); commands
  :init
    (defvar clearcase-command-mode-map)
    (define-prefix-command 'clearcase-command-mode-map)
    ("C-x S-c" . clearcase-command-mode-map)
  :config
    (setq clearcase-suppress-checkout-comments t)
  :bind (
    ; clearcase key commands
    ; C-x C o          checkout current
    ; C-x C i          checkin current
    ; C-x C diff       diff current versus pred
    ; C-x C edcs       edit current configspec
    ; C-x C lsco       list all current checkouts in view
    ; C-x C mkelem     make the current buffer an element
    ; C-x C unco       uncheckout the current buffer
    :map clearcase-command-mode-map
      ("o" . clearcase-checkout-current-buffer)
      ("i" . clearcase-checkin-current-buffer)
      ("d i f f" . clearcase-ediff-pred-current-buffer)
      ("e d c s" . clearcase-edcs-edit)
      ("l s c o" . clearcase-find-checkouts-in-current-view)
      ("m k e l e m" . clearcase-mkelem-current-buffer)
      ("u n c o" . clearcase-uncheckout-current-buffer)
    ) ; end :bind
  )







