;; Package.el
;; Used for package management against different repos.
;; This tool is used by use-package and therefore cannot rely on it

; package is included in Emacs 24.x and later, so we just need to add a repo source
; Prior to that, we need to specify the file as a manual load, and add a different repo source
(when (< emacs-major-version 24)
  (load-file "~/.emacs.d/package23.x/package.el"))

(require 'package)

;  There is a small bug in Emacs 24’s package.el such that the dependency order comes out backwards. The problem is patched by some advice.
(when (= emacs-major-version 24)
 (defadvice package-compute-transaction
  (before package-compute-transaction-reverse (package-list requirements) activate compile)
    "reverse the requirements"
    (setq requirements (reverse requirements))
    (print requirements)))

;Emacs 25 and later can do asynchronous package operations
(when (>= emacs-major-version 25)
  (setq package-menu-async t)) ; do activities asynchronously

; Always add melpa-stable
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;older than emacs-24
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))


;; Ensure we have package info, updating it if we don't have any (happens every time)
;(unless package-archive-contents
;  (package-refresh-contents))

; Check for the flag file in the configuration directory.  Create it after
; initializing package the first time.
(when (not (file-exists-p "~/.emacs.d/.package-init.done"))
  (package-initialize)
  (shell-command "touch ~/.emacs.d/.package-init.done")
 )

;; All packages that are needed from a package repo should use the ":ensure t" tag in their use-package
;; line, or ":ensure repoPackageName" if the name in the repo doesn't match the name that's downloaded.
;; To pin to a specific archive, use the ":pin archive" tag in the call.  If you don't want it auto-updated
;; you'll have to ":pin manual"

;; A different overlay for the package manager that doesn't lock up when loading
;; the package lists.  Doing the following will overwrite how the "list-packages"
;; command works by default so it uses this new one instead.
(require 'paradox)
(paradox-enable)
