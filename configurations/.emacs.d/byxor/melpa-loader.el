(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (protocol (if no-ssl "http" "https")))

  (add-to-list 'package-archives (cons "melpa" (concat protocol "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat protocol "://stable.melpa.org/packages/")) t)

  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat protocol "://elpa.gnu.org/packages/")))))
