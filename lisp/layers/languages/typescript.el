(setq auto-mode-alist
      (append '(("\\.ts\\'" . typescript-mode)
		("\\.vue\\'". typescript-mode))
	      auto-mode-alist))

(add-hook 'typescript-mode-hook
	  '(lambda ()
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
