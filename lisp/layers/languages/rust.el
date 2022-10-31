;; rust.el
;;
;; Created on 2021/12/23 by Dante Ruiz
;; Copyright 2021 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/
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

(add-hook 'rust-mode-hook 'lsp)
(add-hook 'before-save-hook
	  (lambda ()
	    (when (eq major-mode 'rust-mode)
	      (rust-format-buffer))))
(add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target\\'")
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\Cargo.lock\\'"))
