(load-file "~/.emacs.d/lisp/functions/on-editing.el")
(require 'functions-on-editing)

(global-set-key (kbd "M-w") 'other-window)
(global-set-key (kbd "C-d") 'minibuffer-keyboard-quit)
(define-key vertico-map (kbd "M-n") 'vertico-previous)
(define-key vertico-map (kbd "M-p") 'vertico-next)

(xterm-mouse-mode t)
(global-set-key (kbd "<mouse-4>") 'previous-line)
(global-set-key (kbd "<mouse-5>") 'next-line)

(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-n") 'forward-sentence)
(global-set-key (kbd "M-p") 'backward-sentence)
(global-set-key (kbd "M-i") 'beginning--line)
(global-set-key (kbd "M-;") 'end-of-line)

(global-set-key (kbd "C-w") 
		'(lambda () 
		   (interactive) 
		   (kill-buffer-and-window)))

;;edition action
(global-set-key (kbd "C-/") 'comment-dwim)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-s") 'isearch-forward)

(global-set-key (kbd "M-o") 
		'(lambda () 
		   (interactive) 
		   (end-of-line) 
		   (newline)))

(defun wl-copy (text) 
  (setq wl-copy-process (make-process :name "wl-copy" 
				      :buffer nil 
				      :command '("wl-copy") 
				      :connection-type 'pipe)) 
  (process-send-string wl-copy-process text) 
  (process-send-eof wl-copy-process))
(defun wl-paste () 
  (if (and wl-copy-process 
	   (process-live-p wl-copy-process)) ;nil should return nil if we're the current paste owner
      (shell-command-to-string "wl-paste")))
;; (setq interprogram-cut-function 'wl-copy)
;; (setq interprogram-paste-function 'wl-paste)


;;window operation
(global-set-key (kbd "C-k") 'delete-other-windows)

(global-set-key (kbd "M-u") nil)
(global-set-key (kbd "M-u s") 'save-buffer)
(global-set-key (kbd "M-u u") 'lsp-bridge-popup-documentation)
(global-set-key (kbd "M-u k") 'keyboard-escape-quit)
(global-set-key (kbd "M-u e") 'eval-buffer)
(global-set-key (kbd "M-u f") 'lsp-bridge-code-format)
(global-set-key (kbd "M-u a") 'lsp-bridge-code-action)
(global-set-key (kbd "M-u i") 'execute-extended-command)
(global-set-key (kbd "M-u k") 'kill-current-buffer)
(global-set-key (kbd "M-u w") 'other-window)

(global-set-key (kbd "C-<tab>") 'switch-to-next-buffer)
(global-set-key (kbd "M-y") 
		'(lambda () 
		   (interactive) 
		   (wl-copy 
		    (buffer-substring-no-properties 
		     (region-beginning) 
		     (+ 1 (region-end))))))
(global-set-key (kbd "M-v") 
		'(lambda () 
		   (interactive) 
		   (insert (shell-command-to-string "wl-paste")) 
		   (backward-delete-char 1) ))
(global-set-key (kbd "M-u ESC") nil)

(provide 'keymappings)
