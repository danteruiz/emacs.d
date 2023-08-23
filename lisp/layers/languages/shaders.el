;; shaders.el

;; Created on 2021/07/09 by Dante Ruiz
;; Copyright 2021 Dante Ruiz

;; Distributed under the MIT Lisense
;; https://mit-license.org/

;;; Code:

(require 'common)
(better-editing/add-to-header-list '("fs" "frag"))
(better-editing/add-to-source-list '("vs" "vert"))

(use-package glsl-mode
  :ensure t)

(setq auto-mode-alist
      (append '(("\\.fs\\'" . glsl-mode)
		("\\.vs\\'" . glsl-mode)
		("\\.frag\\'" . glsl-mode)
		("\\.vert\\'" . glsl-mode))
	      auto-mode-alist))

(add-hook 'glsl-mode-hook
	  '(lambda ()
	     (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             (setq c-continued-statemant-offset 2)
             (c-set-offset 'substatement-open 0)
	     (c-set-offset 'inlambda 0)
             (c-set-offset 'case-label '+)))
