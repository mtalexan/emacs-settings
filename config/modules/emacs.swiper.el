;; An alternative to helm or ido, this is really an extension of Ivy

;; really an extension of Ivy
(use-package swiper
  ;only if we have ivy
  :requires ivy
  ; get it from package.el
  :ensure t
  :after (
          ivy
   ); after
  :commands (
             swiper
             swiper-query-replace
             swiper-all-query-replace
             swiper-avy
             swiper-mc ; needs multiple-cursors
             swiper-recenter-top-bottom
             swiper-from-isearch
             swiper-multi
             swiper-all
             swiper-map
             swiper-all-map
   ) ; end :commands
  :init

  :config

    ; minimum match length before highlighting. Default=2
    (setq swiper-min-highlight 2)

    ;non-nil includes line numbers in swiper match output. Default=nil
    (setq swiper-include-line-number-in-search t)

    ;goes to the start of the match rather than the end when non-nil. Default=nil
    (setq swiper-goto-start-of-match t)

    ;non-nil means don't go back to where search was started from when quitting with
    ; nothing picked. Default=nil
    (setq swiper-stay-on-quit nil)

    ;non-nil recenters after exiting swiper.  isearch doesn't do this, but occur does. Default=nil
    (setq swiper-action-recenter nil)

  :bind (
    :map swiper-map
      ([remap ivy-avy] . swiper-avy) ; swiper-unique variant of ivy-avy
      ;("C-w" . ivy-yank-symbol) ; see ivy-minibuffer-map this is inherited from
      ("M-q" . swiper-query-replace) ; default setting

    :map swiper-all-map
      ([remap ivy-avy] . swiper-avy) ; swiper-unique variant of ivy-avy.
      ;("C-w" . ivy-yank-symbol) ; see ivy-minibuffer-map  this is inherited from
      ("M-q" . swiper-all-query-replace) ; default setting
    ) ;end of :bind
  ) ; end of use-package
