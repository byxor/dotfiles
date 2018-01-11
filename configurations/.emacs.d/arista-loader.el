(defun attempt-load-library (library)
  (if (not (equal (locate-library library) nil))
      (load-library library)
      (message "Library '%s' not found. Skipping..." library)))
 
;; Makes TAB do the right thing for various languages.
(attempt-load-library "arastra-indent")

;; Integration with a4, for checking files out and for
;; compiling/running/debugging within emacs.
(attempt-load-library "a4")

;; Makes C-v and M-v do what they should, rather than what Stallman wanted;
;; specifically, makes C-v and M-v inverses of each other so pressing one
;; and then the other is always a no-op.
(if (featurep 'xemacs)
    (attempt-load-library "scroll-in-place"))

;; Makes M-k switch to a recently used buffer, with lightning
;; completion.  Wrapper for iswitchb
(attempt-load-library "nifty-buffer")

;; Gives you "C-x f" to find file at point.  Useful for jumping to
;; errors, etc.
(attempt-load-library "nifty-file")

;; Gives you C-z and M-z for running shells inside emacs.  Emacs is good
;; for you.
(attempt-load-library "ashell")

;; Gives you M-e and M-r for sane defining and running of keyboard
;; macros.
(attempt-load-library "keyboard-macros")

;; Some little useful functions like C-ct for a timestamp
(attempt-load-library "arastra-utils")

;; Dynamic completion of words with Meta-return
(autoload 'dabbrev-expand "dabbrev" "Expand previous word \"dynamically\".")

;; Support for gnu id-utils
(autoload 'gid "id-utils" "Lookup a string in a mkid database" t)

;; Support for coloring buffer regions
(autoload 'colorize "colorize" "Supporting for coloring regions" t)

;; Other improvements (IMO) over default emacs keybindings.
(attempt-load-library "misc-bindings")

;; Arista gid extensions
(attempt-load-library "a4-gid")

;; Have gnuclient always use the same frame if not running in X
;; emacsclient does this by default.
(if (featurep 'xemacs)
    (if (eq (frame-type) 'tty)
        (setq gnuserv-frame t)))

;; Not sure what this does
;; (require 'aformat-mode)

;; Disable fsync
(setq write-region-inhibit-fsync t)

;; Hook to enable pdb-track under emacs24.x
(add-hook 'comint-output-filter-functions
          'python-pdbtrack-comint-output-filter-function)

;; Golang support.
(attempt-load-library "go-mode")
(add-hook 'before-save-hook 'gofmt-before-save)









