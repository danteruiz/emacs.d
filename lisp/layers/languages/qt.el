(defun major-mode/qt ()
  (use-package qml-mode
   :ensure t)
  (setq auto-mode-alist
	(append '(("\\.qml\\'" . qml-mode))
		auto-mode-alist))
  (add-hook 'qml-mode-hok
	    '(lambda ()
	       (setq tab-width 4)
	       (setq indent-tabs-mode nil))))
