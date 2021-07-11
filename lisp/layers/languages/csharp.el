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
