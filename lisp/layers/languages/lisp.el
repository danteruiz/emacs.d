;;; Code:
(use-package flycheck-elsa
  :ensure t
  :hook (emacs-lisp-mode . flycheck-elsa-setup))

(use-package flycheck-package
  :ensure t
  :hook (emacs-lisp-mode . flycheck-package-setup))

(use-package elisp-def
  :ensure t)

(use-package elisp-slime-nav
  :ensure t)

(defun elisp-setup ()
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-capf))
  (company-mode)
  (copilot-mode)
  (flycheck-mode))

(add-hook 'emacs-lisp-mode-hook 'elisp-setup)
