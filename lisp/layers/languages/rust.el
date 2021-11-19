(use-package flycheck
  :ensure t)


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
	("C-p". company-select-pervious)
	("M-<". company-select-first)
	("M->". company-select-last)))

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
		      "rn" 'cargo-process-new
		      "rb" 'cargo-process-build
		      "rr" 'cargo-process-run)))

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
    (setq lsp-log-io nil))
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp))
  :commands lsp)

(add-hook 'before-save-hook
	  (lambda ()
	    (when (eq major-mode 'rust-mode)
	      (rust-format-buffer))))
;; (add-hook 'rust-mode-hook 'flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target\\'")
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\Cargo.lock\\'"))
