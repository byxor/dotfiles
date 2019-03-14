;;; go-imports-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "go-imports" "go-imports.el" (23686 29304 53673
;;;;;;  801000))
;;; Generated autoloads from go-imports.el

(autoload 'go-imports-reload-packages-list "go-imports" "\
Reload package-name to package-path mappings by reading *.go
files under GOROOT and GOPATH.

\(fn)" t nil)

(autoload 'go-imports-insert-import "go-imports" "\
Insert go import statement for PACKAGE. For example, if
PACKAGE is \"ioutil\", then line \"io/ioutil\" will be inserted
in the import block in the file.

When this function is called for the first time, it will
initialize the mappings from package names (\"ioutil\") to the
package path (\"io/ioutil\") by listing all the *.go files under
directories named in GOROOT and GOPATH environment variables. The
mapping is checkpointed in DIR/.go-imports-packages.el, where DIR
is the first directory in GOPATH.

The package-name mappings are *not* automatically updated as *.go
files are modified.  Call go-imports-reload-packages-list to
reload the mappings.

\(fn PACKAGE)" t nil)

;;;***

;;;### (autoloads nil nil ("go-imports-pkg.el") (23686 29304 58400
;;;;;;  39000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; go-imports-autoloads.el ends here
