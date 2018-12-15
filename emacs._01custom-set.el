;; Don't edit this by hand, instead use the Options->Customize Emacs
;; from the menubar and edit the options from the customization groups.
;; Saving the changes there actually saves them here.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-coding-alist
   '(("\\.\\(arc\\|zip\\|lzh\\|lha\\|zoo\\|[jew]ar\\|xpi\\|rar\\|ARC\\|ZIP\\|LZH\\|LHA\\|ZOO\\|[JEW]AR\\|XPI\\|RAR\\)\\'" . no-conversion-multibyte)
     ("\\.\\(exe\\|EXE\\)\\'" . no-conversion)
     ("\\.\\(sx[dmicw]\\|odt\\|tar\\|tgz\\)\\'" . no-conversion)
     ("\\.\\(gz\\|Z\\|bz\\|bz2\\|gpg\\)\\'" . no-conversion)
     ("\\.\\(jpe?g\\|png\\|gif\\|tiff?\\|p[bpgn]m\\)\\'" . no-conversion)
     ("\\.pdf\\'" . no-conversion)))
 '(auto-coding-regexp-alist
   '(("\\`BABYL OPTIONS:[ 	]*-\\*-[ 	]*rmail[ 	]*-\\*-" . no-conversion)
     ("\\`\376\377" . utf-16be-with-signature)
     ("\\`\377\376" . utf-16le-with-signature)
     ("\\`\357\273\277" . utf-8-with-signature)))
 '(bs-must-always-show-regexp "[~]*[^*#].*")
 '(c-basic-offset 4)
 '(c-default-style
   '((c-mode . "")
     (c++-mode . "")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(c-doc-comment-style
   '((c-mode . gtkdoc)
     (c++-mode . gtkdoc)
     (java-mode . javadoc)
     (pike-mode . autodoc)))
 '(column-number-mode t)
 '(custom-safe-themes
   '("f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(delete-active-region 'kill)
 '(ediff-make-buffers-readonly-at-startup nil)
 '(ediff-prefer-iconified-control-frame t)
 '(ediff-split-window-function 'split-window-horizontally t)
 '(ediff-temp-file-prefix "tmp_diff_")
 '(ediff-use-long-help-message t)
 '(ediff-version-control-package 'vc)
 '(ediff-window-setup-function 'ediff-setup-windows-plain t)
 '(elscreen-display-tab nil)
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-use-selectable-prompt t)
 '(kill-do-not-save-duplicates t)
 '(kill-read-only-ok t)
 '(kill-whole-line nil)
 '(package-selected-packages
   '(s shut-up smart-mode-line smooth-scrolling spinner swiper visible-mark pallet paradox hydra rust-mode ivy-rich rg wgrep neotree easy-kill zzz-to-char smart-tabs-mode visual-regexp-steroids visual-regexp ace-window ggtags company projectile counsel ivy avy elscreen ibuffer semantic aggressive-indent json-mode lua-mode color-theme-approximate egg multi-term))
 '(paradox-github-token t)
 '(save-interprogram-paste-before-kill t)
 '(scroll-bar-mode 'right)
 '(select-enable-primary t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(standard-indent 4)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(whitespace-style
   '(face trailing tabs spaces lines newline empty indentation space-before-tab space-mark tab-mark newline-mark))
 '(winner-mode t)
 '(yank-pop-change-selection t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "tan" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(ediff-current-diff-Ancestor ((t (:background "#553333"))))
 '(ediff-current-diff-B ((t (:background "#553333"))))
 '(ediff-current-diff-C ((t (:background "#553333"))))
 '(ediff-even-diff-A ((t (:background "tomato4"))))
 '(ediff-even-diff-Ancestor ((t (:background "tomato4"))))
 '(ediff-even-diff-B ((t (:background "tomato4"))))
 '(ediff-even-diff-C ((t (:background "tomato4"))))
 '(ediff-fine-diff-Ancestor ((t (:background "#aa2222"))))
 '(ediff-fine-diff-B ((t (:background "#aa2222"))))
 '(ediff-fine-diff-C ((t (:background "#aa2222"))))
 '(ediff-odd-diff-A ((t (:background "tomato4"))))
 '(ediff-odd-diff-Ancestor ((t (:background "tomato4"))))
 '(ediff-odd-diff-B ((t (:background "tomato4"))))
 '(ediff-odd-diff-C ((t (:background "tomato4")))))
