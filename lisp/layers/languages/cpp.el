;; cpp and cmake configuration 
(require 'common)
;; cmake configuration
(defun cmake-hook()
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-cmake))
  (company-mode))

(use-package cmake-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
    (add-to-list 'auto-mode-alist '("/CMakeLists\\.cmake\\'" . cmake-mode))
    (add-hook 'cmake-mode-hook 'cmake-hook)))



(better-editing/add-to-header-list '("h"))
(better-editing/add-to-source-list '("cpp" "c" "mm" "m"))
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
	     (c-set-offset 'case-label '+)))
