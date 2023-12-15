;;; bqn-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "bqn-glyph-mode" "bqn-glyph-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from bqn-glyph-mode.el

(register-definition-prefixes "bqn-glyph-mode" '("bqn-glyph-mode"))

;;;***

;;;### (autoloads nil "bqn-keymap-mode" "bqn-keymap-mode.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from bqn-keymap-mode.el

(register-definition-prefixes "bqn-keymap-mode" '("bqn-keymap-mode"))

;;;***

;;;### (autoloads nil "bqn-mode" "bqn-mode.el" (0 0 0 0))
;;; Generated autoloads from bqn-mode.el

(let ((loads (get 'bqn 'custom-loads))) (if (member '"bqn-mode" loads) nil (put 'bqn 'custom-loads (cons '"bqn-mode" loads))))

(autoload 'bqn-mode "bqn-mode" "\
Major mode for editing BQN files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.bqn\\'" . bqn-mode))

(add-to-list 'interpreter-mode-alist '("bqn" . bqn-mode))

(autoload 'bqn-comint-buffer "bqn-mode" "\
Run an inferior BQN process inside Emacs and return its buffer." t nil)

(register-definition-prefixes "bqn-mode" '("bqn-"))

;;;***

;;;### (autoloads nil "bqn-symbols" "bqn-symbols.el" (0 0 0 0))
;;; Generated autoloads from bqn-symbols.el

(register-definition-prefixes "bqn-symbols" '("bqn--symbol"))

;;;***

;;;### (autoloads nil nil ("bqn-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; bqn-mode-autoloads.el ends here
