;; .emacs

;; Make sure the "config" directory under the user-config folder, and all subfolders,
;; are in the load path
(let ((default-directory
	(concat user-emacs-directory
		(convert-standard-filename "config"))))
  (normal-top-level-add-subdirs-to-load-path))

;; Only the options from before the custom-set-variables and custom-set-faces
(load "emacs._00preload")
;; The custom-set variables
(load "emacs._01custom-set")
;; basic functionality modifications
(load "emacs._02base")
;; basic keys
(load "emacs._03keys")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Non-Package Modules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Basic new functionality or modifications to built-in functionality which isn't part of a new package
(load "emacs.isearch")
(load "emacs.ediff")
(load "emacs.cursor-color")
(load "emacs.winner")
(load "emacs.lock-window")
(load "emacs.indent-tabs")
(load "emacs.window-split-direction")
(load "emacs.unpop-mark")
(load "emacs.smart-beginning-of-line")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Module Settings Variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar use-helm-instead-of-ivy nil ; default ivy-counsel-swiper
  "Variable selecting between helm and ivy/counsel/swiper in custom config")
(defvar use-avy-instead-of-ace-jump t ; default avy
  "Variable selecting between Avy and ace-jump-mode in custom config")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Module Local Overrides
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This file can optionally exist, and will override some things in the settings for existing packages
;; It can also change the defvar settings above
(let ((file "emacs.local-overrides"))
  (if (file-executable-p file) (load file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Modules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "emacs.linum")
(load "emacs.smoothscrolling")
(load "emacs.visible-mark")
(load "emacs.rich-minority")
(load "emacs.smart-mode-line")
(load "emacs.elscreen")
(when use-helm-instead-of-ivy ; must be done before the avy vs ace-jump-mode check
    (load "emacs.helm"))
(if use-avy-instead-of-ace-jump ; pick either ace-jump-mode or avy
   (load "emacs.avy")
   (load "emacs.ace-jump-mode")
  )
(when (not use-helm-instead-of-ivy)
    (load "emacs.ivy")
    (load "emacs.ivy-rich")
    (load "emacs.counsel")
    (load "emacs.swiper")
  )
(load "emacs.projectile")
(when use-helm-instead-of-ivy
    (load "emacs.helm-projectile"))
(load "emacs.company")
(load "emacs.semantic")
(load "emacs.ggtags") ; auto-handles dependence on gtags installed on host
(load "emacs.ace-window")
(load "emacs.visual-regexp")
(load "emacs.visual-regexp-steroids")
(load "emacs.ibuffer")
(load "emacs.smart-tab")
(load "emacs.guess-style")
(load "emacs.zzz-to-char")
(load "emacs.easy-kill")
(load "emacs.rg") ; auto-handles dependence on ripgrep installed on host
(load "emacs.neotree") ; hidden until F8 is pressed

;; Things that can be considered for enabling but aren't
;(load "emacs.function-args")
;(load "emacs.xcscope")
;(load "emacs.clearcase")
;(load "emacs.sr-speedbar")
;(load "emacs.egg")
;multi-term doesn't show output correctly
;(load "emacs.multi-term")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local emacs script is the only thing that should be loaded here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This should always be last.  It configures for the specific system and isn't tracked, so it should be
;; able to optionally override everything else in this file
(let ((file "emacs.local"))
  (if (file-executable-p file) (load file)))

