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
