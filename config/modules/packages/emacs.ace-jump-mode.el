;; A quick-jump tool for within visible, see Avy as a better alternative

(use-package ace-jump-mode
  :ensure t
  :commands (
    ace-jump-mode
    ace-jump-word-mode
    ace-jump-line-mode
    ace-jump-char-mode
    ace-jump-mode-pop-mark
   ) ; end :commands
  :init
   (define-key global-map (kbd "C-:") 'ace-jump-mode)
   (define-key global-map (kbd "C-M-,") 'ace-jump-mode-pop-mark)
  :config
    ;; Swap the char and line mode defaults
    (setq ace-jump-mode-submode-list
      '(ace-jump-word-mode              ;; the first one always map to : C-c SPC
        ace-jump-line-mode              ;; the second one always map to: C-u C-c SPC            
        ace-jump-char-mode) )           ;; the third one always map to ：C-u C-u C-c SPC

    ; Set the scope of matches: global, frame, window, or visible.
    (setq ace-jump-mode-scope 'visible)

    ; Autoswitch to char-mode when punctuation is entered (default is t, enabled, set to nil to disable)
    (setq ace-jump-mode-detect-punc t)

    ; synchronize between the ace-jump mark ring and the global mark ring
    (ace-jump-mode-enable-mark-sync)
    ;(ace-jump-mode-disable-mark-sync)

 :bind (
    ; main key
    ("C-:" . ace-jump-mode)
    ; Pops between visible frames too
    ("C-M-," . ace-jump-mode-pop-mark)
    ) ;end of :bind
  ) ; end of use-package




