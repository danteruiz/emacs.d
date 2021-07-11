(defun major-mode/rust ()
  (use-package flycheck-rust
    :ensure t)

  (use-package rust-mode
    :ensure t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))))

  (use-package cargo
    :ensure t
    :config
    (progn
      (bind-prefix-keys 'leader-prefix-map
			"rn" 'cargo-process-new)))
  (use-package racer
    :ensure t
    :hook (rust-mode . racer-mode)
    :config
    (progn
      (defun my-racer-mode-hook ()
	(set (make-local-variable 'company-backends)
	     '((compnay-capf company-files)))
	(setq company-minimum-prefix-length 1)
	(setq indent-tabs-mode nil))
      ;;(add-hook 'racer-mode-hook 'my-racer-mode-hook)
      (add-hook 'racer-mode-hook #'company-mode)
      (add-hook 'racer-mode-hook #'eldoc-mode)))
  (add-hook 'before-save-hook
	    (lambda ()
	      (when (eq major-mode 'rust-mode)
			(rust-format-buffer))))
  (add-hook 'rust-mode-hook 'flycheck-mode)
  (add-hook 'flycheck-mode-hook 'flycheck-rust-setup))
