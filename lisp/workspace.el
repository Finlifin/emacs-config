(use-package centaur-tabs
  ;; :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("M-b" . centaur-tabs-backward)
  ("M-f" . centaur-tabs-forward))



(setq centaur-tab-style "bar")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-plain-icons t)
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-modified-marker "*")

