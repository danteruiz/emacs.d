;; csharp.el
(require 'utils)
(defvar csharp-packages
  '(
    csharp-mode
    ))

(install-packages csharp-packages)
(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))
