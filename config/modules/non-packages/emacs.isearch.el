(require 'isearch)
;; ISearch modifications
;; Redefine the keybinding that normally copies the rest of the word
;; forward from the point to copy the whole of the current symbol and
;; search forward with that.
;; Note that this may get further overridden by counsel or helm modes.
(define-key isearch-mode-map (kbd "C-w") 'isearch-forward-symbol-at-point)
