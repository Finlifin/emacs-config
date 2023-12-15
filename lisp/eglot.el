(remove-hook 'flymake-diagnostic-functions 'eglot-flymake-backend)
(use-package eglot 
:defer t 
:config (setq read-process-ouput-max (* 1024 1024)) 
(add-hook 'c-mode-hook 'eglot-ensure) 
(add-hook 'c++-mode-hook 'eglot-ensure) 
(add-hook 'zig-mode-hook 'eglot-ensure) 
(add-hook 'elisp-mode-hook 'eglot-ensure) 
(add-hook 'rust-mode-hook 'eglot-ensure) 
(add-hook 'scala-mode-hook 'eglot-ensure)
  ;; (add-hook 'haskell-mode-hook 'eglot-ensure)
  (push :documentHightProvider eglot-ignored-server-capabilities))


(use-package flycheck
  :init
(global-flycheck-mode t)
(global-flycheck-eglot-mode t)
  :custom
   (flycheck-highlighting-mode 'sexps "well"))


;; (global-flycheck-inline-mode t)
(global-set-key (kbd "C-M-i") 'eglot-format-buffer)

;;TODO, flycheck, treesite, jinx, autopair

;;lsp for myself: rust, elixir, python, elisp, julia, c/c++, zig, crystal, nil, awk, fish, bash, sh, haskell, typescript/javascript, java, dart, lua, idris, yaml, json, toml
