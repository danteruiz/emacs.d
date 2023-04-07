;; python.el
;;
;; Created on 2022/03/24 by Dante Ruiz
;; Copyright 2022 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

;;; Code:

(use-package python-mode
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :hook ((python-mode . flycheck-mode)
	 (python-mode . lsp)
	 (python-mode . copilot-mode))
  :init
  (progn
    ;; (add-hook 'python-mode-hook 'lsp)
    ;; (add-hook 'python-mode-hook 'flycheck-mode)
    ;; (add-hook 'python-mode-hook 'copilot-mode)
    (setq lsp-pylsp-plugins-autopep8-enabled t)
    (setq lsp-pylsp-plugins-flake8-ignore '("D100"))))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; python.el ends here
