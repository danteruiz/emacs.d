;;; code
(use-package lsp-java
  :hook ((java-mode . lsp))
  :ensure t
  :config
  (progn
    (setq lsp-java-trace-server nil)
    (setq lsp-java-references-code-lens-enabled nil)
    (setq lsp-java-import-gradle-enabled nil)
    (setq lsp-java-import-maven-enabled nil)
    (setq lsp-java-signature-help-enabled nil)
    ;; (setq lsp-java-format-settings-url "https://your-hosted-url.com/google-eclipse-style.xml")
    ;; (setq lsp-java-format-settings-profile "GoogleStyle")  ;; Optional, if needed

    ))


