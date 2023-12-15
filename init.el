(setq gc-cons-threshold 24000000)
(setq read-process-output-max (* 1024 1024))
(defvar k-gc-timer
  (run-with-idle-timer 5 t 'garbage-collect))
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)




(load-file "~/.emacs.d/lisp/options.el")
(require 'options)

(load-file "~/.emacs.d/lisp/outlook.el")
(require 'outlook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.3)
 '(company-tooltip-align-annotations t)
 '(company-tooltip-annotation-padding 3)
 '(custom-safe-themes
   '("eb5fadab2cc7bd59852c774addaa6a7ef3a360d676578a0c8d3fe86bf4391735" "ed91d4e59412defda16b551eb705213773531f30eb95b69319ecd142fab118ca" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "1100638bf0729ccc14aeb2dd8a5aa32b738344a3fd8dba9ebfde144f71c4ed5a" "4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" default))
 '(mode-line-position-column-format '("C%c\\t"))
 '(package-selected-packages
   '(ct sideline-lsp sideline-flycheck flycheck-inline vertico-posframe kanagawa-theme evil-collection evil-anzu meow spaceline dashboard centaur-tabs treesit-auto bqn-mode lsp-metals scala-mode julia-vterm tree-sitter vertico cape lsp-scheme geiser-guile corfu-doc corfu-terminal media-progress-dirvish rg orderless smooth-scrolling corfu dirvish eglot elisp-format elisp-docstring-mode toml-mode yaml-mode json-mode idris-mode lua-mode elixir-mode nix-mode caddyfile-mode dart-mode avy nerd-icons-completion nerd-icons eat coterm clues-theme afternoon-theme deadgrep nord-theme typescript-mode zig-mode fish-mode crystal-mode haskell-mode julia-ts-mode python-mode julia-mode rust-mode markdown-preview-mode yasnippet dired vterm evil smooth-scroll fuzzy auto-complete auto-completion ## company-box lsp-mode company helm poet-theme use-package ligature fira-code-mode)))

(load-file "~/.emacs.d/lisp/packages.el")
(require 'my-packages)

(load-file "~/.emacs.d/lisp/keymappings.el")
(require 'keymappings)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(popup-tip-face ((t (:background "#110225" :foreground "#ddd")))))

(put 'dired-find-alternate-file 'disabled nil)
