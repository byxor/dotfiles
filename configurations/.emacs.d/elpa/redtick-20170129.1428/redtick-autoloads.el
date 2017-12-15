;;; redtick-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "redtick" "redtick.el" (23088 56370 565792
;;;;;;  630000))
;;; Generated autoloads from redtick.el

(defvar redtick-mode nil "\
Non-nil if Redtick mode is enabled.
See the command `redtick-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `redtick-mode'.")

(custom-autoload 'redtick-mode "redtick" nil)

(autoload 'redtick-mode "redtick" "\
Little pomodoro timer in the mode-line.

\(fn &optional ARG)" t nil)

(autoload 'redtick "redtick" "\
Enable minor-mode, and start the pomodoro.

\(fn)" t nil)

(autoload 'redtick-with-description "redtick" "\
Ask for DESCRIPTION, enable minor-mode, and start the pomodoro.

\(fn DESCRIPTION)" t nil)

;;;***

;;;### (autoloads nil nil ("redtick-pkg.el") (23088 56370 575576
;;;;;;  581000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; redtick-autoloads.el ends here
