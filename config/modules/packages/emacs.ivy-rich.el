;; Extends ivy to set different display transformers, e.g. ivy-switch-buffer has more content

(use-package ivy-rich
  ; only load this if we have ivy
  :requires ivy
  ; get it from package.el
  :ensure t
  :after (
          ivy
          )
  :commands (
             ivy-rich
             ivy-rich-mode
   )
  :init
    (require 'ivy-rich)
    (ivy-rich-mode 1)
  :config
    ; Actually use this package as the display transformer for ivy-switch-buffer
    ; deprecated, replaced with (ivy-rich-mode 1)
    ;(ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)

    ; Align the virtual buffers too
    ;(setq ivy-virtual-abbreviate 'full
    ;      ivy-rich-switch-buffer-align-virtual-buffer t)

    ; Set to: abbrev, abbreviate, full, absolute, relative or anything else.
    ; abbrev/abbreviate uses abbreviate-file-name (e.g. ~/ instead of /home/user/)
    ; full/absolute always give full path
    ; relative/anything else uses relative paths from where you're at
    (setq ivy-rich-path-style 'abbrev)

    ; Maximum length of a file name. Default=32
    ;(setq ivy-rich-switch-buffer-name-max-length 32)

    ; Maximum length of mode name. Default=18
    ;(setq ivy-rich-switch-buffer-mode-max-length 18)

    ; Maximum projectile project name. Default=15
    ;(setq ivy-rich-switch-buffer-project-max-length 15)

    ; Column separator. Default=""
    (setq ivy-rich-switch-buffer-delimiter "|")

    ; Align virtual buffers too? Default=nil
    ;(setq ivy-rich-switch-buffer-align-virtual-buffer nil)

    ; Parse extra details (e.g. project) from remote files? Default=t
    (setq ivy-rich-parse-remote-buffer nil)

    ; ivyr-rich-path-style applies to remote files also? Default=nil
    (setq ivy-rich-parse-remote-file-path nil)
    
  ) ; end of use-package




