;; Make M-w mark/kill things when there's no active region

(use-package easy-kill
  :ensure t
  :commands (
             easy-kill
   ) ; end :commands
  :config

  :bind (
     ([remap kill-ring-save] . easy-kill)
     ;; Default chord follow ups, repeating expands to the next as well
     ;; w - word
     ;; s - sexp
     ;; l - list (enclosing sexp)
     ;; d - defun
     ;; D - current defun name
     ;; f - file at point (only if on a file name)
     ;; b - current buffer name (+ to full name, 0 to basename)

     ;; Default after at least one selection above
     ;; @ - append to previous kill in killring and exit
     ;; C-w - kill seletion and exit
     ;; +,-,1..9 - expand/shrink selection
     ;; 0 - shrink to initial unexpanded size
     ;; C-SPC or M-SPC - turn into active region
     ;; C-g - abort
     ;; ? - help

   ) ;end of :bind
  ) ; end of use-package
