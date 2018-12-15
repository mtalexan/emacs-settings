;; An alternative to helm or ido, this is really an extension of Ivy

;; really an extension of Ivy
(use-package counsel
  ; get it from package.el
  :ensure t
  :after (
          ivy
   ); after
  :commands (
             counsel-mode
             counsel-M-x
             counsel-descbinds
             counsel-describe-function
             counsel-describe-variable
             counsel-describe-face
             counsel-faces
             counsel-find-file
             counsel-find-library
             counsel-ibuffer
             counsel-load-library
             counsel-load-theme
             counsel-yank-pop
             counsel-info-lookup-symbol
             counsel-mark-ring
             counsel-bookmark
             counsel-grep-or-swiper
             counsel-grep
             counsel-tmm
             counsel-yank-pop
             counsel-imenu
             counsel-expression-history
             counsel-ace-link ;replace ace-link
             counsel-hydra-heads ; used with hydra
             counsel-semantic-or-imenu ; jump to symbols, imenu works if semantic doesn't usually
             counsel-company
             counsel-colors-emacs
             counsel-colors-web
             counsel-faces
             counsel-command-history
             counsel-irony ; requires irony backend
             counsel-apropos
   ) ; end :commands
  :init
    (counsel-mode)
    ; Default bindings performed by counsel-mode
    ;(execute-extended-command . counsel-M-x)
    ;(describe-bindings . counsel-descbinds)
    ;(describe-function . counsel-describe-function)
    ;(describe-variable . counsel-describe-variable)
    ;(describe-face . counsel-describe-face)
    ;(list-faces-display . counsel-faces)
    ;(find-file . counsel-find-file)
    ;(find-library . counsel-find-library)
    ;(imenu . counsel-imenu)
    ;(load-library . counsel-load-library)
    ;(load-theme . counsel-load-theme)
    ;(yank-pop . counsel-yank-pop)
    ;(info-lookup-symbol . counsel-info-lookup-symbol)
    ;(pop-to-mark-command . counsel-mark-ring)
    ;(bookmark-jump . counsel-bookmark)))
  :config

    ; add file under point to candidate list for counsel-find-file (default nil)
    (setq counsel-find-file-at-point t)

    ; pre-select current file in counsel-find-file (default nil)
    (setq counsel-preselect-current-file t)

    ; When file is larger than this, use grep instead of swiper. Default 300000
    (setq counsel-grep-swiper-limit 300000)


    ; Want to use the counsel-mark-ring command with C-u C-<, but want the pop-to-mark-command under C-<
    (defun if-pop-to-mark-or-counsel-mark-with-universal ()
      "Calls pop-to-mark-command, but if preceeded with \\[universal-argument] it calls counsel-mark-ring
      "
      (interactive)
      (call-interactively
       (if (equal current-prefix-arg nil)
           'pop-to-mark-command
           'counsel-mark-ring
         )
       )
      )

    ; Want to use the counsel-yank-pop command with C-u M-y, but want the yank-pop under M-y
    (defun if-yank-pop-or-counsel-yank-pop-with-universal ()
      "Calls yank-pop command, but if preceeded with \\[universal-argument] it calls counsel-yank-pop
      "
      (interactive)
      (call-interactively
       (if (equal current-prefix-arg nil)
           'yank-pop
           'counsel-yank-pop
         )
       )
      )

    ; if rgrep is installed, use that instead of grep for the command underlying counsel-grep-or-swiper
    (when (executable-find "rg")
      (setq counsel-grep-base-command
            "rg --smart-case --max-columns 120 --no-heading --line-number --color never '%s' %s"))

    ; counsel-yank-pop preselects what yank-pop would use rather than the
    ; last thing yanked (C-u 1 instead of C-u 0) when nil.  counsel-yank-pop
    ; doesn't include defaults in the yank ring though
    ; Default nil.
    (setq counsel-yank-pop-preselect-last nil)

  :bind (
     ("C-c C-r" . ivy-resume) ; rebind to what's specified in the ivy file
     ("C-x b" . ivy-switch-buffer) ; counsel-ibuffer sucks, use ivy-switch-buffer with ivy-rich instead
     ("C-x C-b" . ivy-switch-buffer) ; counsel-ibuffer sucks, use ivy-switch-buffer with ivy-rich instead
     ("C-x C-f" . counsel-find-file)
     ; replace C-s and C-r with this counsel-grep-or-swiper
     ("C-s" . counsel-grep-or-swiper) ; can use avy-isearch from this too
     ("C-r" . counsel-grep-or-swiper) ; can use avy-isearch from this too
     ("C-c C-." . counsel-semantic-or-imenu)

     ("C-c C-b" . counsel-bookmark)
     ;counsel tries to override C-< with counsel-mark-ring, reset it so that requires \\[universal-argument]
     ("C-<" . if-pop-to-mark-or-counsel-mark-with-universal)
     ;counsel tries to override M-y with counsel-yank-pop, reset it so that requires \\[universal-argument]
     ("M-y" . if-yank-pop-or-counsel-yank-pop-with-universal)

   ) ;end of :bind
  ) ; end of use-package




