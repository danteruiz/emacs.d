(defun reload-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key [f12] 'reload-init)
