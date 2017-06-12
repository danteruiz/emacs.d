(defun get-system ()
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (progn
      (message "Linux System")))))


(setq is-lunix t)
