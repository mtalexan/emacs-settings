
;; Make sure the "config" directory under the user-config folder, and all subfolders,
;; are in the load path
(let ((default-directory
	(concat user-emacs-directory
		(convert-standard-filename "config"))))
  (normal-top-level-add-subdirs-to-load-path))
