(setq PREFIX "C-z")

(defun custom-shortcut (shortcut)
  (kbd (format "%s %s" PREFIX shortcut)))

(global-set-key (kbd PREFIX) nil)

;; Modes
(global-set-key (custom-shortcut "C-e") 'electric-indent-mode)
(global-set-key (custom-shortcut "C-l") 'mc/edit-lines)

(global-set-key (custom-shortcut "C-n C-n") 'neotree)
(global-set-key (custom-shortcut "C-n C-h") 'neotree-hidden-file-toggle)
(global-set-key (custom-shortcut "C-n C-r") 'neotree-change-root)

(global-set-key (custom-shortcut "C-o") 'ace-window

(global-set-key (custom-shortcut "C-s") 'sr-speedbar-toggle)
(global-set-key (custom-shortcut "C-z") 'zoom-window-zoom)

(let ((key (kbd "<f1> p")))
     (progn (global-set-key key nil)
            (persp-set-keymap-prefix key)))

;; Customisation
(global-set-key (custom-shortcut "C-t") 'customize-themes)
(global-set-key (custom-shortcut "C-p") 'list-packages)

;; Whitespace
(global-set-key (custom-shortcut "C-w") 'delete-trailing-whitespace)
(global-set-key (custom-shortcut "C-t") (lambda () (interactive) (setq tab-width 4)))

;; Comments
(global-set-key (custom-shortcut "C-c") 'comment-region)
(global-set-key (custom-shortcut "M-c") 'uncomment-region)
