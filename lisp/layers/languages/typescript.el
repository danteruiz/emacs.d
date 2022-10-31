(use-package web-mode
  :ensure t
  :hook (web-mode . hook-web-mode)
  :config
  (defun hook-web-mode()
    (setq comment-start "/*")
    (setq comment-end "*/")
    (setq c-basic-offset 2)
    (setq tab-width 2)
    (setq indent-tabs-mode nil)
    (setq c-continued-statemant-offset 2)
    (c-set-offset 'substatement-open 0)
    (c-set-offset 'inlambda 0)
    (c-set-offset 'innamespace 0)
    (c-set-offset 'brace-list-intro '+)
    (c-set-offset 'brace-list-open 0)
    (c-set-offset 'case-label '+)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-css-indent-offset 2)))
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode)))
