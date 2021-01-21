
(defvar template-replacement-alist
  '(("%filename%" . (lambda ()
		      (file-name-nondirectory buffer-file-name)))
    ("%creator%" . user-full-name)
    ("%author%" . user-full-name)
    ("%year%" . (lambda () (format-time-string "%Y")))
    ("%date%" . (lambda () (format-time-string "%Y/%m/%d")))))

(defun template/insert-file-header (file)
  (interactive)
  (buffer-disable-undo)
  (insert-file file)
  (goto-char (point-min))
  (let ((the-list template-replacement-alist))
    (while the-list
      (goto-char (point-min))
      (replace-string (car (car the-list))
		      (funcall (cdr (car the-list)))
		      nil)
      (setq the-list (cdr the-list))))
  (goto-char (point-min))
  (buffer-enable-undo)
  (set-buffer-modified-p nil))


(defun template/personal-file-header ()
  (interactive)
  (message "template file: %s" template-directory)
  (template/insert-file-header
   (concat template-directory ".personal.cpp.template")))

(provide 'file-template)
