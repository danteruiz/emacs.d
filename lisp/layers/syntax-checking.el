;; syntax-checking
(defvar syntax-checking-packages
  '(
    flycheck
    flycheck-pos-tip
    ))

(install-packages syntax-checking-packages)

(use-package flycheck
  :defer t
  :init
  (progn
    ))