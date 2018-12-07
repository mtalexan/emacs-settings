; An ace-jump-mode like tool, but provides necessary dependencies for ace-window.

; NOTE: minimal necessary to force install, but not usage.  ace-window dependencies in MELPA are screwed up
;       and this fixes the problem
(use-package avy
  ; get it from package.el
  :ensure t
  :commands (
    avy-linum-mode ; temporary minor mode used with avy-goto-line
    avy-goto-char-in-line ; like char, macth in current line only
    avy-goto-char ; 1 char entry before matching
    avy-goto-char-2 ; 2 char entry before matching
    avy-goto-char-2-above ;char-2, but current window up to current point only
    avy-goto-char-2-below ;char-2, but current window after current point only
    avy-goto-word-0 ;word start, no chars before matching
    avy-goto-word-0-above ;word-0, but current window up to current point only
    avy-goto-word-0-below ;word-0, but current window after current point only
    avy-goto-word-1 ;word start, 1 char before matching
    avy-goto-word-1-above ;word-1, but current window up to current point only
    avy-goto-word-1-below ;word-1, but current window after current point only
    avy-goto-symbol-1 ; symbol start, 1 char before matching
    avy-goto-symbol-1-above ;symbol-1, but current window up to current point only
    avy-goto-symbol-1-below ;symbol-1, but current window after current point only
    avy-goto-subword-0 ; word-0, but "words" include {=}*:><
    avy-goto-subword-1 ; word-1, but "words" include {=}*:><
    avy-goto-line ; like word-0 but lines, entry "1" does matches line numbers, "4" modifies scope
    avy-goto-line-above ; like line, but current windows up to current point only
    avy-goto-line-below ; like line, but current windows before current point only
    avy-copy-line ; interactive, copy a selected line to avy-line-insert-style (above/below) current line
    avy-move-line ; interactive, copy a selected line to avy-line-insert-style (above/below) current line
    avy-copy-region ; interactive, select two lines, copy text between them to point
    avy-move-region ; interactive, select two lines, move text between them to point
    avy-kill-region ; interactive, select two lines, kill text between them (saves to kill ring)
    avy-kill-ring-save-region ; like avy-kill-region, but save region to kill ring without actually killing
    avy-kill-whole-line ; interactive, pick a line to kill (saves to kill ring)
    avy-kill-ring-save-whole-line ; like avy-kill-whole-line, but save to kill ring without actually killing
    avy-setup-default ;default configuration
    avy-goto-char-timer ; starts like char-2 but times out to char if configurable timeout is reached first
    avy-push-mark
    avy-pop-mark
    avy-org-goto-heading-timer ;read one or many chars for jump match like char-timer
    avy-org-refile-as-child ; refile current heading as first child of selected heading
    avy-resume ;resume previous avy session
    avy-isearch ;jump to an isearch candidate (from within isearch)
   ) ; end :commands
  :init
    ; Sets C-' as avy-isearch in isearch-mode-map
    (avy-setup-default)
  :config
    ; Use the letters listed as decision keys rather than just the homerow keys
    ; (number-sequenc ?a ?z) can also be used instead of a list
    ; WARNING: the following keys are normally reserved for avy actions if not used in the avy-keys list
    ;          x=avy-action-kill-move
    ;          X=avy-action-kill-stay
    ;          t=avy-action-teleport
    ;          m=avy-action-mark
    ;          n=avy-action-copy
    ;          y=avy-action-yank
    ;          i=avy-action-ispell
    ;          z=avy-action-zap-to-char
    ; WARNING: avy limits to 2 cycles of jump keys, so this list needs to have enough to
    ;          index everything within that number of loops
    (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?w ?e ?r ?u ?o ?p ?c ?v ?b))

    ; Overlay style for keys: pre, at, at-full, or post
    (setq avy-style 'at)

    ; Grey out the background when making selection. Default is nil/disabled
    (setq avy-background t)

    ; What to find selection candidates in: nil (current window), t (current frame), or all-frames
    (setq avy-all-windows 'all-frames)

    ; All matches are selected with lowercase chars (default enabled)
    (setq avy-case-fold-search t)

    ; timeout time between avy-goto-char-timer switching between avy-goto-char-2 and avy-goto-char
    (setq avy-timeout-seconds 0.8)

    ; non-nil, avy-goto-char-timer timeout exists immediately on Enter. nil, it enters a newline
    (setq avy-enter-times-out t)
    
    ; Set to regexp of punctuation chars to match as part of word when searching.  Set nil to disable
    ;(setq avy-word-punc-regexp nil)

    ; when using avy-copy-line and avy-move-line, where is the selected line copied/moved relative to the
    ; current line.  Options: above (default), below
    ;(setq avy-line-insert-style 'above)

 :bind (
    ; Main key entry
    ("C-:" . avy-goto-char)
    ; Starts single character select against beginning of words
    ("M-:" . avy-goto-char-in-line)
    ("M-;" . avy-goto-word-1)
    ("C-M-;" . avy-goto-char)
    ("C-M-:" . avy-goto-line)
    ("C-:" . avy-resume)

    ; Pops between visible frames too
    ("C-M-," . avy-pop-mark)

    ;Customize so avy-isearch can be triggered with the normal keybinding for avy
    :map isearch-mode-map
      ("M-;" . avy-isearch) ; see ivy-avy command also
  ) ;end of :bind

)
