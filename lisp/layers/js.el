
(defvar javascript-packages
  '(
    js2-mode
    ))

(install-packages javascript-packages)

(use-package js2-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    (add-hook 'js-mode-hook
	      '(lambda ()
		 (setq tab-width 4)
		 (setq indent-tabs-mode nil)
		 (js2-imenu-extras-mode)))))
