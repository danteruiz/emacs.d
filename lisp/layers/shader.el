;; shader.el
(require 'utils)
(defvar shader-packages
  '(glsl-mode))

(install-packages c-c++-packages)

(add-to-list 'auto-mode-alist '("\\.fs\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.vs\\'" . c++-mode))

(add-hook 'glsl-mode-hook
	  '(lambda ()
	     (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             (setq c-continued-statemant-offset 2)
             (c-set-offset 'substatement-open 0)
	     (c-set-offset 'inlambda 0)
             (c-set-offset 'case-label '+)))
