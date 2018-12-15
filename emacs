;; .emacs

;; Only the options from before the custom-set-variables and custom-set-faces
(load-file "~/.emacs.d/emacs._00preload.el")
(load-file "~/.emacs.d/emacs._01custom-set.el")
(load-file "~/.emacs.d/emacs._02base.el")
(load-file "~/.emacs.d/emacs._03keys.el")

;; Basic new functionality or modifications to built-in functionality
;; that's not part of a new package
(load-file "~/.emacs.d/emacs.isearch.el")
(load-file "~/.emacs.d/emacs.ediff.el")
(load-file "~/.emacs.d/emacs.cursor-color.el")
(load-file "~/.emacs.d/emacs.winner.el")
(load-file "~/.emacs.d/emacs.lock-window.el")
(load-file "~/.emacs.d/emacs.indent-tabs.el")
(load-file "~/.emacs.d/emacs.window-split-direction.el")
(load-file "~/.emacs.d/emacs.unpop-mark.el")
(load-file "~/.emacs.d/emacs.smart-beginning-of-line.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modules/Packages should be added here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Set a variable we use to determine whether we're using Ivy-Counsel-Swiper or Helm before
; the emacs.local-overrides so it can be set there if we want something different locally
(defvar use-helm-instead-of-ivy nil "Variable selecting between helm and ivy in custom config")

; Set a variable we use to determine whether we're using Ivy-Counsel-Swiper or Helm before
; the emacs.local-overrides so it can be set there if we want something different locally
(defvar use-avy-instead-of-ace-jump t "Variable selecting between Avy and ace-jump-mode in custom config")

; This file can optionally exist, and will override some things in the settings for existing packages
(let ((file "~/.emacs.d/emacs.local-overrides.el"))
  (if (file-executable-p file) (load-file file)))

(load-file "~/.emacs.d/emacs.linum.el")
(load-file "~/.emacs.d/emacs.smoothscrolling.el")
(load-file "~/.emacs.d/emacs.visible-mark.el")
(load-file "~/.emacs.d/emacs.rich-minority.el")
(load-file "~/.emacs.d/emacs.smart-mode-line.el")
;multi-term doesn't show output correctly
;(load-file "~/.emacs.d/emacs.multi-term.el")
(load-file "~/.emacs.d/emacs.elscreen.el")
(when use-helm-instead-of-ivy
    (load-file "~/.emacs.d/emacs.helm.el"))
; pick either ace-jump-mode or avy
(if use-avy-instead-of-ace-jump
   (load-file "~/.emacs.d/emacs.avy.el")
   (load-file "~/.emacs.d/emacs.ace-jump-mode.el")
  )
(when (not use-helm-instead-of-ivy)
    (load-file "~/.emacs.d/emacs.ivy.el")
    (load-file "~/.emacs.d/emacs.ivy-rich.el")
    (load-file "~/.emacs.d/emacs.counsel.el")
    (load-file "~/.emacs.d/emacs.swiper.el")
  )
(load-file "~/.emacs.d/emacs.projectile.el")
(when use-helm-instead-of-ivy
    (load-file "~/.emacs.d/emacs.helm-projectile.el"))
(load-file "~/.emacs.d/emacs.company.el")
(load-file "~/.emacs.d/emacs.semantic.el")
(load-file "~/.emacs.d/emacs.ggtags.el")
(load-file "~/.emacs.d/emacs.ace-window.el")
(load-file "~/.emacs.d/emacs.visual-regexp.el")
(load-file "~/.emacs.d/emacs.visual-regexp-steroids.el")
(load-file "~/.emacs.d/emacs.ibuffer.el")
(load-file "~/.emacs.d/emacs.smart-tab.el")
(load-file "~/.emacs.d/emacs.guess-style.el")
(load-file "~/.emacs.d/emacs.zzz-to-char.el")
(load-file "~/.emacs.d/emacs.easy-kill.el")
; auto-handles dependence on ripgrep installed on host
(load-file "~/.emacs.d/emacs.rg.el")
; hidden until F8 is pressed
(load-file "~/.emacs.d/emacs.neotree.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local emacs script is the only thing that should be loaded here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Things that can be considered for the emacs.local script
;(load-file "~/.emacs.d/emacs.function-args.el")
;(load-file "~/.emacs.d/emacs.xcscope.el")
;(load-file "~/.emacs.d/emacs.clearcase.el")
;(load-file "~/.emacs.d/emacs.sr-speedbar.el")
;(load-file "~/.emacs.d/emacs.egg.el")

;; This should always be last.  It configures for the specific system and isn't tracked, so it should be
;; able to optionally override everything else in this file
(let ((file "~/.emacs.d/emacs.local.el"))
  (if (file-executable-p file) (load-file file)))

