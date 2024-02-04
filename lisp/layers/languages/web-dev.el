;;; package --- Summary
;;; web-dev.el
;;
;;; Commentary:
;; Created on 2023/04/12 by Dante Ruiz
;; Copyright 2023 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/
;;
;;; Code:

(use-package prettier-js
  :ensure t
  :hook ((web-mode . prettier-js-mode))
  :config
  (setq prettier-js-args '("--trailing-comma" "all")))

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode)
	 ("\\.jsx\\'" . js2-jsx-mode)))

(use-package typescript-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-mode)
	 ("\\.tsx\\'" . typescript-mode)))

(use-package web-mode
  :ensure t
  :mode (("\\.html\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.ts\\'" . web-mode)
	 ("\\.js\\'" . web-mode)
	 ("\\.vue?\\'" . web-mode))
  :hook ((web-mode . lsp)
	 (web-mode . my-web-mode-hook))
  :config
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-enable-auto-pairing t)
    (setq web-mode-enable-auto-closing t)
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
    (c-set-offset 'case-label '+)))
;;; web-dev.el ends here
