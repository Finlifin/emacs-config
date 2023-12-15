(use-package 
  corfu
  ;; Optional customizations
  :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t) ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary nil) ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  (corfu-preview-current 1) ;; Disable current candidate preview
  (corfu-min-with 400) 
  (corfu-count 18) 
  (corfu-echo-documentation nil) 
  (corfu-auto-prefix 1) 
  (lsp-completion-provider :none) ; Use corfu instead the default for lsp completions
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `global-corfu-modes'.
  :init (global-corfu-mode) 
  :hook (lsp-completion-mode . kb/corfu-setup-lsp) ; Use corfu for lsp completion
  :config
  ;; Setup lsp to use corfu for lsp completion
  (defun kb/corfu-setup-lsp () 
    "Use orderless completion style with lsp-capf instead of the
  default lsp-passthrough."
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults)) 
	  '(orderless))))



;; (add-to-list 'load-path "/home/fin/gitsrc/emacs-corfu-doc-terminal")

(setq corfu-auto t corfu-quit-no-match 'separator)
(unless (display-graphic-p) 
  (corfu-terminal-mode +1))



;; (add-hook 'corfu-mdoe-hook #'corfu-doc-terminal-mode)

;; Enable Corfu more generally for every minibuffer, as long as no other
;; completion UI is active. If you use Mct or Vertico as your main minibuffer
;; completion UI. From
;; https://github.com/minad/corfu#completing-with-corfu-in-the-minibuffer
(defun corfu-enable-always-in-minibuffer () 
  "Enable Corfu in the minibuffer if Vertico/Mct are not active."
  (unless (or (bound-and-true-p mct--active) ; Useful if I ever use MCT
              (bound-and-true-p vertico--input))
    ;; (setq-local corfu-auto nil)       ; Ensure auto completion is disabled
    (corfu-mode 1)))



;; (add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)



;; Use Dabbrev with Corfu!
(use-package 
  dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion) 
	 ("C-M-/" . dabbrev-expand))
  ;; Other useful Dabbrev configurations.
  :custom (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))



;; Optionally use the `orderless' completion style.
(use-package 
  orderless 
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic) completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))



(use-package 
  kind-icon 
  :after corfu 
  :custom (kind-icon-use-icons t) 
  (kind-icon-default-face 'corfu-default) ; Have background color be the same as `corfu' face background
  (kind-icon-blend-background nil) ; Use midpoint color between foreground and background colors ("blended")?
  (kind-icon-blend-frac 0.08)



  ;; NOTE 2022-02-05: `kind-icon' depends `svg-lib' which creates a cache
  ;; directory that defaults to the `user-emacs-directory'. Here, I change that
  ;; directory to a location appropriate to `no-littering' conventions, a
  ;; package which moves directories of other packages to sane locations.
  ;; (svg-lib-icons-dir (no-littering-expand-var-file-name "svg-lib/cache/")) ; Change cache dir
  :config (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter) ; Enable `kind-icon'

  ;; Add hook to reset cache so the icon colors match my theme
  ;; NOTE 2022-02-05: This is a hook which resets the cache whenever I switch
  ;; the theme using my custom defined command for switching themes. If I don't
  ;; do this, then the backgound color will remain the same, meaning it will not
  ;; match the background color corresponding to the current theme. Important
  ;; since I have a light theme and dark theme I switch between. This has no
  ;; function unless you use something similar
  (add-hook 'kb/themes-hooks #'(lambda () 
				 (interactive) 
				 (kind-icon-reset-cache))))
