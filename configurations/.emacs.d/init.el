;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun relatively-import (file-name)
  (load-file
   (expand-file-name file-name (file-name-directory load-file-name))))

(relatively-import "melpa-loader.el")
(relatively-import "arista-loader.el")

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(column-number-mode 1)
(show-paren-mode 1)
(ido-mode 1)
(global-linum-mode 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))
