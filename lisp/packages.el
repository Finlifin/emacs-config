(use-package helm)



(load "~/.emacs.d/lisp/evil.el")
(load "~/.emacs.d/lisp/eglot.el")
(load "~/.emacs.d/lisp/cmp.el")
(load "~/.emacs.d/lisp/files.el")
(load "~/.emacs.d/lisp/workspace.el")

(load "~/.emacs.d/lisp/minibuffer.el")



(use-package smooth-scrolling
:init (smooth-scrolling-mode 1))



;; A few more useful configurations...
(use-package emacs
:init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))



;;nerd icons configuration, TODO...
(use-package nerd-icons)



(use-package nerd-icons-completion
:config (nerd-icons-completion-mode))



;;A plugin for jumping convenience
(use-package avy)



(use-package yasnippet
:diminish yas-minor-mode
:hook (prog-mode . yas-minor-mode)
:config (yas-reload-all))



(use-package yasnippet-snippets
:defer t
:after yasnippet)



;; (use-package marginalia
;;   :general
;;   (:keymaps 'minibuffer-local-map
;;    "M-A" 'marginalia-cycle)
;;   :custom
;;   (marginalia-max-relative-age 0)
;;   (marginalia-align 'right)
;;   :init
;;   (marginalia-mode))
(use-package marginalia
:init (marginalia-mode))



(use-package vertico
  ;; Special recipe to load extensions conveniently
  ;; :straight (vertico :files (:defaults "extensions/*")
  ;;                    ;; :includes (vertico-indexed
  ;;                    ;;            vertico-flat
  ;;                    ;;            vertico-grid
  ;;                    ;;            vertico-mouse
  ;;                    ;;            vertico-quick
  ;;                    ;;            vertico-buffer
  ;;                    ;;            vertico-repeat
  ;;                    ;;            vertico-reverse
  ;;                    ;;            vertico-directory
  ;;                    ;;            vertico-multiform
  ;;                    ;;            vertico-unobtrusive
  ;;                    ;;            ))
  ;; 		     :include (vertico-unobtrusive))
  ;; :general
  ;; (:keymaps 'vertico-map
  ;;  "<tab>" #'vertico-insert    ; Choose selected candidate
  ;;  "<escape>" #'minibuffer-keyboard-quit ; Close minibuffer
  ;;  ;; NOTE 2022-02-05: Cycle through candidate groups
  ;;  "C-M-n" #'vertico-next-group
  ;;  "C-M-p" #'vertico-previous-group)
  :custom (vertico-count 14)	     ; Number of candidates to display
  (vertico-resize t)
(vertico-cycle nil) ; Go from last to first candidate and first to last (cycle)?
  :config (vertico-mode))
(vertico-grid-mode)
(vertico-reverse-mode)



(use-package vterm
:hook (vterm-mode-hook . evil-emacs-state))



(use-package sideline
:init (setq sideline-backends-right '(sideline-flycheck)))




(setq lsp-completion-provider
:none)
(defun corfu-lsp-setup ()
(setq-local completion-styles '(orderless) completion-category-defaults nil))
(add-hook 'lsp-mode-hook #'corfu-lsp-setup)



(require 'flex-autopair)
(flex-autopair-mode 1)



(require 'auto-package-update)

(provide 'my-packages)
