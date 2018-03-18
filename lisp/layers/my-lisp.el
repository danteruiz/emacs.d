;;
;; lisp.el
;;

(require 'use-package)
(defvar lisp-packages
  '(smartparens
    autopair))

(install-packages lisp-packages)

(require 'autopair)
(use-package smartparens-config
  :ensure smartparens
  :config
  (progn
    (show-smartparens-global-mode t)))

(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
	      (setq flycheck-check-syntax-automatically '(save))
	      (company-mode)
	      (flycheck-mode)
	      (company-mode)
	      (smartparens-mode)))
