;;Magit-Blame in the other window

(defun magit-blame-other-window ()
  (interactive)

  (setq buffer-name (generate-new-buffer-name "*magit blame buffer*"))
  (setq previopus-buffer-file-name (buffer-file-name))
  (pop-to-buffer (make-indirect-buffer (current-buffer) buffer-name))
  (setq buffer-file-name previous-buffer-file-name)
  (magit-blame 1)
  (goto-char (point-min)))

(global-set-key (kbd "C-x g b")
