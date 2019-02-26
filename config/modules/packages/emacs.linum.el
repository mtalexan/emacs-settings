;; Places line numbers along the left edge.  Numbering is done on each window.

; This package is included in Emacs 24.x by default
(use-package linum
  ;; part of emacs now, causes errors if we do ensure t on them
  ;;:ensure t
  :commands (
             linum-mode
   )
  ;; replace the :init with this :hook if we only want it for c and c++ modes
  ;:hook ((c++-mode c-mode) . linum-mode)
  :init
    ;; Enable global mode (always visible)
    (global-linum-mode t)
  :config
    ;; Clear linum-eager mode
    (setq linum-eager nil)
    ;; Pick a numbering alignment
    ;; left align the numbering with spaces between numbers and content
    ;(setq linum-format "%d ")
    ;; right align the numbering with a space between numbers and content
    (setq linum-format
          (lambda (line)
            (propertize
             (format
              (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
                (concat "%" (number-to-string w) "d "))
              line)
             'face 'linum)))
  )

