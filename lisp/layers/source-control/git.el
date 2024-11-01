(use-package magit
  :ensure t
  :config
  (progn
    (bind-prefix-keys 'leader-prefix-map
		      "gs" 'magit-status
		      "gb" 'magit-blame-addition
		      )))
