;; Package.el
;; Used for package management against different repos.
;; Already included in 24, and repos allowed are different
(when (>= emacs-major-version 24)
  (add-to-list 'load-path "~/.emacs.d/package/")
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(when (< emacs-major-version 24)
  (add-to-list 'load-path "~/.emacs.d/package/")
  (load-file "~/.emacs.d/package/package.el")
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  )
