;;; toml-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "toml-mode" "toml-mode.el" (0 0 0 0))
;;; Generated autoloads from toml-mode.el

(autoload 'toml-mode "toml-mode" "\
Major mode for TOML files.

Comments start with `#'.

For details see `https://github.com/toml-lang/toml'.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.toml\\'" . toml-mode))

(register-definition-prefixes "toml-mode" '("toml-mode-"))

;;;***

;;;### (autoloads nil nil ("toml-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; toml-mode-autoloads.el ends here
