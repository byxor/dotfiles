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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (light-blue)))
 '(indent-tabs-mode nil)
 '(markdown-command "/usr/bin/pandoc"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
