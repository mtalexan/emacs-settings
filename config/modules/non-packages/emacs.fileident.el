;; File identification customization

(require 'python)
;; Add SConscript as a recognized python script file (front of list)
(add-to-list 'auto-mode-alist '("SConscript[^/]+\\'" . python-mode))

(require 'lisp-mode)
;; Anything starting with emacs or .emacs should be lisp-mode
(add-to-list 'auto-mode-alist '("[.]?emacs.*" . lisp-mode))

(require 'make-mode)
;; Modify some of the file type identification
(add-to-list 'auto-mode-alist '("Makefile" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("GNUMakefile" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.mk\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.defs\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.class\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '(".?Config.*" . makefile-gmake-mode))

(require 'cc-mode)
;; C++ File Identification Change
;; Identify .h files as C++ by default rather than C
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

