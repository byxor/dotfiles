(setq PREFIX "C-z")

(defun custom-shortcut (shortcut)
  (kbd (format "%s %s" PREFIX shortcut)))

(global-set-key (kbd PREFIX) nil)
  
(global-set-key (custom-shortcut "C-z") 'zoom-window-zoom)
(global-set-key (custom-shortcut "C-T") 'delete-trailing-whitespace)
(global-set-key (custom-shortcut "C-a") 'ace-window)
(global-set-key (custom-shortcut "C-l") 'linum-mode)
(global-set-key (custom-shortcut "C-s") 'sr-speedbar-toggle)
(global-set-key (custom-shortcut "C-c") 'comment-region)
(global-set-key (custom-shortcut "M-c") 'uncomment-region)
(global-set-key (custom-shortcut "C-n") 'neotree)
(global-set-key (custom-shortcut "C-e") 'electric-indent-mode)
(global-set-key (custom-shortcut "C-t") 'customize-themes)
(global-set-key (custom-shortcut "C-p") 'list-packages)
