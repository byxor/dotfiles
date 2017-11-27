(package-initialize)


(defun relatively-import (file-name)
  (let ((file-name (expand-file-name
                   file-name
                   (file-name-directory load-file-name))))
    (print file-name)
    (load-file file-name)))


(mapcar 'relatively-import
        '("melpa-loader.el"
          "arista-loader.el"
          "custom-binds.el"
          "default-modes.el"
          "disable-startup-message.el"
          "autosave-changes.el"))


(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" default)))
 '(markdown-command "/usr/bin/pandoc")
 '(package-selected-packages
   (quote
    (pomidor pomodoro tdd-status-mode-line afternoon-theme abyss-theme markdown-mode auto-complete ace-window 2048-game))))
(custom-set-faces

 )
