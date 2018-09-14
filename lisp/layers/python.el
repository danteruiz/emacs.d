(require 'utils)

(defvar python-packages '(elpy
			  jedi))

(install-packages python-packages)

(defun python-hook ()
  (elpy-enable)
  (flycheck-mode))
(use-package elpy
  :defer t
  :init
  (progn
    (add-hook 'python-mode-hook 'python-hook)))
