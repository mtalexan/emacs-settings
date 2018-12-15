;; File identification customization

;; Add SConscript as a recognized python script file (front of list)
(setq auto-coding-alist (cons '("SConscript[^/]+\\'" . python-mode) auto-coding-alist))

;; Anything starting with emacs or .emacs should be lisp-mode
(setq auto-mode-alist (cons '("[.]?emacs.*" . lisp-mode) auto-mode-alist))

;; Modify some of the file type identification
(add-to-list 'auto-mode-alist '("Makefile" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("GNUMakefile" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.mk\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.defs\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.class\\'" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '(".?Config.*" . makefile-gmake-mode))

;; C++ File Identification Change
;; Identify .h files as C++ by default rather than C
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

