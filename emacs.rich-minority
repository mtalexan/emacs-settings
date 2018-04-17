;; Hide some of the minor modes from the mode line
;; turned on by default if smart-mode-line is also used

(use-package rich-minority
  ; get it from package.el
  :ensure t
  :init
    (rich-minority-mode 1) ;default setting (not needed if using smart-mode-line as well)
  :config
    ;list of minor modes to never show in the list.  Note that most start with a space
    (setq rm-blacklist '(" Helm"
                         " company"
                         " Abbrev"
                         " Fill"
                         " ARev"
                         " Tail"
                         " Fly"
                         " o^o"
                         " Chg"
                         " Outl"
                         " Egg"
                         " GG"
                         " FA"
                         " Projectile*"
                         " counsel"
                         " ivy"
                         " swiper"
                         " Compile"))
  ) ; end of use-package
