(defun goto-next-empty-line ()
  "Move cursor to the next empty line."

  (interactive)
  (let ((empty-line-found nil))
    (while (not empty-line-found)
      (forward-line)
      (setq empty-line-found (looking-at "^$")))
    (beginning-of-line)))

(defun goto-previous-empty-line ()
  "Move cursor to the previous empty line."
  (interactive)
  (let ((empty-line-found nil))
    (while (not empty-line-found)
      (forward-line -1)
      (setq empty-line-found (looking-at "^$")))
    (beginning-of-line)))



(provide 'functions-on-editing)
