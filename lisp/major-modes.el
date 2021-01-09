;;(require 'autopair)
;;objective-c
;;cpp
;;qml
;;eslp
;;js2-mode
;;company-tern
;;glsl-mode
;;csharp
;;omnisharp
(defun major-mode/cpp ()
  (setq auto-mode-alist
	(append '(("\\.h\\'" . c++-mode)
		  ("\\.cpp\\'" . c++-mode)
		  ("\\.hpp\\'" . c++-mode)
		  ("\\.mm\\'" . objc-mode)
		  ("\\.m\\'" . objc-mode))
		auto-mode-alist))

  (add-hook 'c++-mode-hook
	    '(lambda ()
	       (setq c-basic-offset 4)
	       (setq tab-width 4)
	       (setq indent-tabs-mode nil)
	       (setq c-continued-statemant-offset 2)
	       (c-set-offset 'substatement-open 0)
	       (c-set-offset 'inlambda 0)
	       (c-set-offset 'brace-list-intro '+)
	       (c-set-offset 'brace-list-open 0)
	       (c-set-offset 'case-label '+)))

  (add-hook 'objc-mode-hook
	    '(lambda ()
	       (setq c-basic-offset 4)
	       (setq tab-width 4)
	       (setq indent-tabs-mode nil)
	       (setq c-continued-statemant-offset 2)
	       (c-set-offset 'substatement-open 0)
	       (c-set-offset 'inlambda 0)
	       (c-set-offset 'brace-list-open 0)
	       (c-set-offset 'case-label '+))))

(defun major-mode/elisp ()
  (use-package smartparens-config
    :ensure smartparens
    :config
    (progn
      (show-smartparens-global-mode t)))

  (add-hook 'emacs-lisp-mode-hook
	    #'(lambda ()
		(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
		(setq flycheck-check-syntax-automatically '(save))
		(company-mode)
		(flycheck-mode)
		(company-mode)
		(smartparens-mode))))

(defun major-mode/qt ()
  (setq auto-mode-alist
	(append '(("\\.qml\\'" . qml-mode))
		auto-mode-alist))
  (add-hook 'qml-mode-hok
	    '(lambda ()
	       (setq tab-width 4)
	       (setq indent-tabs-mode nil))))

(defun major-mode/org ()
  (use-package org
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.org'" . org-mode))
      (setq org-agenda-files (quote ("~/org/")))))
  (use-package org-bullets
    :ensure t
    :hook (org-mode . org-bullets-mode))
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-b" 'org-iswitch))

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

(defun major-mode/shaders ()
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
             (c-set-offset 'case-label '+))))

(defun major-mode/csharp ()
  (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))
  (add-hook 'csharp-mode-hook
	    '(lambda ()
	       (omnisharp-mode)
	       (flycheck-mode)
	       (company-mode)
	       (eval-after-load
		   'company
		 '(add-to-list 'company-backends 'company-omnisharp)))))

(defun major-mode/cmake ()
  (defun cmake-hook()
    (eval-after-load 'company
      '(add-to-list 'company-backends 'company-cmake))
    (company-mode))
  (use-package cmake-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
      (add-to-list 'auto-mode-alist '("/CMakeLists\\.cmake\\'" . cmake-mode))
      (add-hook 'cmake-mode-hook 'cmake-hook))))

(defun major-mode/python ()
  (defun python-hook ()
    (elpy-enable)
    (flycheck-mode))
  (use-package elpy
    :defer t
    :init
    (progn
      (add-hook 'python-mode-hook 'python-hook))))

(provide 'major-modes)
