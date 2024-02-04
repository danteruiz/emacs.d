;; rust.el
;;
;; Created on 2021/12/23 by Dante Ruiz
;; Copyright 2021 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

;;; Code:
(use-package flycheck-rust
  :ensure t)

(defun rust-format-on-save ()
  (when (eq major-mode 'rust-mode)
    (rust-format-buffer)))

(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :hook ((rust-mode . lsp)
	 (rust-mode . flycheck-rust-setup)
	 (before-save . rust-format-on-save))
  :init
  (progn
    (with-eval-after-load 'lsp-mode
      (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target\\'")
      (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\Cargo.lock\\'"))))

(use-package cargo
  :ensure t
  :config
  (progn
    (bind-prefix-keys 'leader-prefix-map
		      "rn" 'cargo-process-new
		      "rb" 'cargo-process-build
		      "rr" 'cargo-process-run)))
