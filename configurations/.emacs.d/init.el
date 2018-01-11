(package-initialize)

(defun relatively-import (file-name)
  (absolutely-import (full-path-of file-name)))

(defun full-path-of (file-name)
  (expand-file-name file-name (file-name-directory load-file-name)))

(defun absolutely-import (file-path)
  (progn (message "Importing '%s'..." file-name) (load-file file-path)))

(mapcar 'relatively-import
        '("melpa-loader.el"
          "arista-loader.el"
          "custom-binds.el"
          "default-modes.el"
          "disable-startup-message.el"
          "autosave-changes.el"))

;; Automated custom stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" default)))
 '(indent-tabs-mode nil)
 '(markdown-command "/usr/bin/pandoc")
 '(package-selected-packages
   (quote
    (treemacs projectile sr-speedbar pomidor pomodoro tdd-status-mode-line afternoon-theme abyss-theme markdown-mode auto-complete ace-window 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
