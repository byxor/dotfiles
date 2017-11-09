;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun relatively-import (file-name)
  (let ((file-name (expand-file-name
                   file-name
                   (file-name-directory load-file-name))))
    (print file-name)
    (load-file file-name)))

(relatively-import "melpa-loader.el")
(relatively-import "arista-loader.el")

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(column-number-mode 1)
(show-paren-mode 1)
(ido-mode 1)
(global-linum-mode 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(global-set-key (kbd "C-x C-a") 'ace-window)
(ac-config-default)

(add-to-list 'load-path "/directory/containing/neotree/")
(require 'neotree)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" default)))
 '(markdown-command "/usr/bin/pandoc")
 '(package-selected-packages
   (quote
    (pomidor pomodoro tdd-status-mode-line afternoon-theme abyss-theme markdown-mode auto-complete ace-window 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
