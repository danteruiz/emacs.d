;;; ide.el --- emacs ide configuration

;; Created on 2022/10/18 by Dante Ruiz
;; Copyright 2022 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

;;; Commentary:

;;; Code:
(use-package flycheck
  :ensure t)

(setq flycheck-emacs-lisp-load-path 'inherit)

(use-package company
  :ensure t
  :config
  (progn
    (setq company-idle-delay 0.2
	  company-minimum-prefix-length 2
	  company-require-match nil
	  company-dabbrev-ignore-case nil
	  campany-dabbrev-downcase nil))
  :bind
  (:map company-active-map
	("C-n". company-select-next)
	("C-p". company-select-previous)
	("M-<". company-select-first)
	("M->". company-select-last)))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package lsp-ivy
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package lsp-mode
  :ensure t
  :config
  (progn
    (setq gc-cons-threshold 100000000)
    (setq read-process-output-max ( * 1024 1024)) ;;1 MB
    (setq lsp-idle-delay 0.500)
    (setq lsp-enable-snippet nil)
    (setq lsp-headerline-breadcrumb-enable nil)
    (setq lsp-ui-sideline-enable nil)
    (setq lsp-ui-sideline-show-code-actions nil)
    (setq lsp-lens-enable nil)
    (setq lsp-ui-doc-enable nil)
    (setq lsp-eldoc-enable-hover nil)
    (setq lsp-signature-auto-activate nil)
    (setq lsp-signature-render-documentation nil)
    (setq lsp-log-io nil)
    (bind-prefix-keys 'leader-prefix-map "lg" 'lsp-find-definition)
    (setq lsp-keymap-prefix "C-c l"))
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package flycheck-pos-tip
  :ensure t
  :after (flycheck)
  :init
  (progn
    (flycheck-pos-tip-mode)
    (setq flycheck-pos-tip-timeout 0)))
;; Local Variables
;; byte-compile-warnings: (not free-vars)
;; End:

;;; ide.el ends here
