(require 'utils)
(defvar ledger-packages
  '(ledger-mode))

(install-packages ledger-packages)

(use-package ledger-mode
  :ensure t
  :mode "\\.dat\\'")
