;; Generates and searches for tags across code sets, allowing navigation
;; using those tags.
;;
;; To be efficient, the host system tool gtags (called "global") should be
;; compiled from source with exuberant-ctags.  Also for proper parsing, the
;; python package "pygments" should be installed.  For better and faster
;; lookup support, id-utils should be inastalled so a database instead of a
;; text file is used.  The full requirements list is:
;;     exuberant-ctags
;;     pygment (included in global/gtags since 6.3.2)
;;     id-utils
;;     global 6.5 or later.
;; WARNING: There's an emacs tool called "ctags" that is not the same as
;; exuberant-ctags' even though the executable is named the same.  Be
;; careful that's not in your path first.
;;
;; Installtion details: https://github.com/leoliu/ggtags
;;
;; Compile global from source:
;;   ./configure --prefix=<PREFIX> --with-exuberant-ctags=<path to ctags>
;;   make
;;   sudo make install
;;
;; Install pygments:
;;   pip install pygments

;; Warn if it's not installed, we'll still compile but these functions won't
;; work.
(if (not (executable-find "gtags"))
    (warn "Cannot find necessary installation of global")
  )

(use-package ggtags
  ;; Only if we have gtags installed
  :if (executable-find "gtags")
  :ensure t
  :after (
          cc-mode
   )
  :commands (
     ggtags-mode
     ggtags-find-reference
     ggtags-idutils-query
     pop-tag-mark
     ) ; end :commands
  :init
    ;; Add a hook to load it for certain derived modes
    (add-hook 'c-mode-common-hook
      (lambda ()
        (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
          (ggtags-mode 1))))
  :config

    (require 'subr-x) ; required for string operations

    ;; parse the gtags location from the command-line
    (if (not ggtags-executable-directory)
        (setq ggtags-executable-directory
              (executable-find "gtags")))
    ;; Allow very large database files
    (setq ggtags-oversize-limit 104857600)
    (setq ggtags-sort-by-nearness t)
    (setq ggtags-use-idutils t)
    (setq ggtags-use-project-gtagsconf nil)

  :bind (
    ("M-," . pop-tag-mark)
    ("M-/" . ggtags-find-reference)
    ("M-]" . ggtags-idutils-query)

    :map ggtags-navigation-map
      ;;Ergo
      ("M-u" . ggtags-navigation-previous-file)
      ("M-o" . ggtags-navigation-next-file)
      ("M-l" . ggtags-navigation-visible-mode)
      ("M-j" . ggtags-navigation-visible-mode)
      ("M-k" . next-error)
      ("M-i" . previous-error)
    ) ; end :bind
  )
