;; shader.el
(require 'utils)
(defvar shader-packages
  '(glsl-mode))

(install-packages shader-packages)

(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'". glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))

(add-hook 'glsl-mode-hook
	  '(lambda ()
	     (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             (setq c-continued-statemant-offset 2)
             (c-set-offset 'substatement-open 0)
	     (c-set-offset 'inlambda 0)
             (c-set-offset 'case-label '+)))
