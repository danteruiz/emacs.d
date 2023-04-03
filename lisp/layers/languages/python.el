;; python.el
;;
;; Created on 2022/03/24 by Dante Ruiz
;; Copyright 2022 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

(use-package python-mode
  :ensure t
  :init
  (progn
    (setq lsp-pylsp-plugins-autopep8-enabled t)
    (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))))

(setq lsp-pylsp-plugins-flake8-ignore '("D100"))
(add-hook 'python-mode-hook 'lsp)
(add-hook 'python-mode-hook 'flycheck-mode)
