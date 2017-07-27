(defun relatively-import (file-name)
  (load-file
   (expand-file-name file-name (file-name-directory load-file-name))))

(relatively-import "melpa-loader.el")
(relatively-import "arista-loader.el")

(column-number-mode 1)
(show-paren-mode 1)
(ido-mode 1)
(global-linum-mode 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))
