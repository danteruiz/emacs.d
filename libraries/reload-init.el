(defun reload-init ()
  (interactive)
  (load-file "c:Users/Dante/.emacs.d/init.el"))

(global-set-key [f12] 'reload-init)
