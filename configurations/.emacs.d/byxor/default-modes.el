;; Visual Enhancements
(column-number-mode 1)
(show-paren-mode 1)
(global-linum-mode 1)

;; Buffer Switching
(ido-mode 1)
(persp-mode 1)

;; Disable GUI menu/tool bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Configure Whitespace/Indentation
(electric-indent-mode 0)
(setq typescript-indent-level 2)

;; File Extensions
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; Go fmt
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

;; Misc
(ac-config-default)
(setq speedbar-initial-expansion-list-name "quick buffers")
(setq sgml-quick-keys 'indent)
(setq web-mode-enable-current-element-highlight t)
