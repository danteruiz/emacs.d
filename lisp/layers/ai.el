(use-package agent-shell
  :ensure t
  :config
  (progn
    (setq agent-shell-opencode-authentication
          (agent-shell-opencode-make-authentication :none t))
    (bind-prefix-keys 'leader-prefix-map
		     "os" 'agent-shell-opencode-start-agent)))
