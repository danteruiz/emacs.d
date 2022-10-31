(defvar better-editing-header-files '())
(defvar better-editing-source-files '())

(defun better-editing/add-to-header-list (files)
  (setq better-editing-header-files (append files better-editing-header-files)))

(defun better-editing/add-to-source-list (files)
  (setq better-editing-source-files (append files better-editing-source-files)))

(provide 'common)
;;; common.el ends here
