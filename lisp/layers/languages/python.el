(defun major-mode/python ()
  (defun python-hook ()
    (elpy-enable)
    (flycheck-mode))
  (use-package elpy
    :defer t
    :init
    (progn
      (add-hook 'python-mode-hook 'python-hook))))
