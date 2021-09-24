
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
(add-hook 'flycheck-mode-hook 'flycheck-rust-setup)



;; (use-package rustic
;;   :ensure
;;   :bind (:map rustic-mode-map
;;               ("M-j" . lsp-ui-imenu)
;;               ("M-?" . lsp-find-references)
;;               ("C-c C-c l" . flycheck-list-errors)
;;               ("C-c C-c a" . lsp-execute-code-action)
;;               ("C-c C-c r" . lsp-rename)
;;               ("C-c C-c q" . lsp-workspace-restart)
;;               ("C-c C-c Q" . lsp-workspace-shutdown)
;;               ("C-c C-c s" . lsp-rust-analyzer-status))
;;   :config
;;   ;; uncomment for less flashiness
;;   ;; (setq lsp-eldoc-hook nil)
;;   ;; (setq lsp-enable-symbol-highlighting nil)
;;   ;; (setq lsp-signature-auto-activate nil)
;; 
;;   ;; comment to disable rustfmt on save
;;   (setq rustic-format-on-save t)
;;   (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))
;; 
;; (defun rk/rustic-mode-hook ()
;;   ;; so that run C-c C-c C-r works without having to confirm, but don't try to
;;   ;; save rust buffers that are not file visiting. Once
;;   ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
;;   ;; no longer be necessary.
;;   (when buffer-file-name
;;     (setq-local buffer-save-without-query t)))
;; 
;; 
;; (use-package lsp-mode
;;   :ensure
;;   :commands lsp
;;   :custom
;;   ;; what to use when checking on-save. "check" is default, I prefer clippy
;;   (lsp-rust-analyzer-cargo-watch-command "clippy")
;;   (lsp-eldoc-render-all t)
;;   (lsp-idle-delay 0.6)
;;   (lsp-rust-analyzer-server-display-inlay-hints t)
;;   :config
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))
;; 
;; (use-package lsp-ui
;;   :ensure
;;   :commands lsp-ui-mode
;;   :custom
;;   (lsp-ui-peek-always-show t)
;;   (lsp-ui-sideline-show-hover t)
;;   (lsp-ui-doc-enable nil))
;; 
;; (use-package company
;;   :ensure
;;   :custom
;;   (company-idle-delay 0.5) ;; how long to wait until popup
;;   ;; (company-begin-commands nil) ;; uncomment to disable popup
;;   :bind
;;   (:map company-active-map
;; 	      ("C-n". company-select-next)
;; 	      ("C-p". company-select-previous)
;; 	      ("M-<". company-select-first)
;; 	      ("M->". company-select-last)))
;; 
;; (use-package yasnippet
;;   :ensure
;;   :config
;;   (yas-reload-all)
;;   (add-hook 'prog-mode-hook 'yas-minor-mode)
;;   (add-hook 'text-mode-hook 'yas-minor-mode))
;; 
;; 
;; (use-package company
;;   ;; ... see above ...
;;   (:map company-mode-map
;; 	("<tab>". tab-indent-or-complete)
;; 	("TAB". tab-indent-or-complete)))
;; 
;; (defun company-yasnippet-or-completion ()
;;   (interactive)
;;   (or (do-yas-expand)
;;       (company-complete-common)))
;; 
;; (defun check-expansion ()
;;   (save-excursion
;;     (if (looking-at "\\_>") t
;;       (backward-char 1)
;;       (if (looking-at "\\.") t
;;         (backward-char 1)
;;         (if (looking-at "::") t nil)))))
;; 
;; (defun do-yas-expand ()
;;   (let ((yas/fallback-behavior 'return-nil))
;;     (yas/expand)))
;; 
;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (or (not yas/minor-mode)
;;             (null (do-yas-expand)))
;;         (if (check-expansion)
;;             (company-complete-common)
;;           (indent-for-tab-command)))))
;; 
;; (use-package flycheck :ensure)
