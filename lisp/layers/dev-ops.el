;; dev-ops config for docker and jenkins stuff

(use-package dockerfile-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("^Dockerfile" . dockerfile-mode))))

(use-package jenkinsfile-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("^Jenkinsfile'" . jenkinsfile-mode))))

(use-package docker-compose-mode
  :ensure t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("/docker-compose\\.yml\\'" . docker-compose-mode))
    (add-to-list 'auto-mode-alist '("/docker-compose.override\\.yml\\'" . docker-compose-mode))))

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package just-mode
  :ensure t
  :mode "^justfile'")

(use-package make-mode
  :ensure t
  :mode "^makefile'")
