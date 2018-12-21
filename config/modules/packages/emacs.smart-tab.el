;; Gets the available smart-tab package

(use-package smart-tabs-mode
  :ensure t
  :commands (
      smart-tabs-mode
   )
  :init
    ;;enable it globally since it only works in the list modes below when indent-tabs-mode is enabled
    (smart-tabs-mode)
  :config
    ;;  set to use smart-tabs whenever indent-tabs-mode is enabled while in these modes
    (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'python 'cperl 'ruby 'nxml)
)

