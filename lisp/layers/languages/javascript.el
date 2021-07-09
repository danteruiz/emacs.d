(defun major-mode/js ()
  (defun js2-hook ()
    (setq tab-width 4)
    (setq indent-tabs-mode nil)
    (js2-imenu-extras-mode)
    (setq flycheck-check-syntax-automatically '(save))
    (add-to-list 'company-backends 'company-tern)
    (tern-mode)
    (company-mode)
    (flycheck-mode))


  (use-package js2-mode
    :defer t
    :init
    (progn
      (setq js2-idle-timer-delay 2)
      (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
      (add-hook 'js-mode-hook 'js2-hook))))

