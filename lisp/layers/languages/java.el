;;; code

(defun java-mode-config ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4))

(defun java-format-buffer ()
  (when (derived-mode-p 'java-mode)
    (lsp-format-buffer)
    (lsp-java-organize-imports)))

(use-package kotlin-mode
  :ensure t
  :mode ("\\.kt\\'" . kotlin-mode))

(use-package lsp-java
  :ensure t
  :hook ((java-mode . java-mode-config)
	 (java-mode . lsp))
  :config
  (progn
    (setq lsp-java-trace-server nil)
    (setq lsp-java-references-code-lens-enabled nil)
    (setq lsp-java-import-gradle-enabled nil)
    (setq lsp-java-import-maven-enabled nil)
    (setq lsp-java-signature-help-enabled nil)

    ;; code formatting
    (setq lsp-java-format-on-type-enabled nil)
    (setq lsp-java-format-enabled t)
    (setq lsp-java-save-actions-organize-imports t)
    (setq lsp-java-format-settings-url "file:///home/dante/git/applications/fx-smartcard-applet/futurex-java-style.xml")
    (setq lsp-java-format-settings-profile "FuturexStyle")
    ))

(add-hook 'java-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook #'java-format-buffer nil t)))
