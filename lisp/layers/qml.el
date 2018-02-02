(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))
(add-hook 'qml-mode-hook
	  '(lambda ()
	     (setq tab-width 4)
	     (setq indent-tabs-mode nil)))
