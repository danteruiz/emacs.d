(require 'column-enforce-mode)
(require 'column-marker)
(require 'fill-column-indicator)

(defun better-editing/whitespace ()
  (use-package whitespace
  :defer t
  :init
  (progn
    (setq emacs-show-trailing-whitespace t)
    (defun emacs/show-trailing-whitespace ()
      (when emacs-show-trailing-whitespace
	(set-face-attribute 'trailing-whitespace nil
			    :background
			    (face-attribute 'font-lock-comment-face
					    :foreground))

	(setq whitespace-style '(lines face trailing tabs lines-tail spaces))
	(setq show-trailing-whitespace t)))

    (add-hook 'prog-mode-hook 'emacs/show-trailing-whitespace))))

(defun better-editing/long-lines ()
  (add-hook 'prog-mode-hook (lambda () (interactive)
			      (column-marker-1 80)))
  (add-hook 'prog-mode-hook 'column-enforce-mode))

(defun better-editing/move-text ()
  (use-package move-text
    :ensure t)
  (global-set-key (kbd "M-p") 'move-text-up)
  (global-set-key (kbd "M-n") 'move-text-down))


(defvar better-editing-header-files '())
(defvar better-editing-source-files '())

(defun better-editing/add-to-header-list (files)
  (setq better-editing-header-files (append files better-editing-header-files)))

(defun better-editing/add-to-source-list (files)
  (setq better-editing-source-files (append files better-editing-source-files)))

(defun better-editing/header-swap ()
  (interactive)
  (setq file-name (file-name-sans-extension buffer-file-name))
  (setq file-extension (file-name-extension buffer-file-name))

  (setq extensions-list nil)
  (if (member file-extension better-editing-header-files)
      (setq extensions-list better-editing-source-files)
    (if (member file-extension better-editing-source-files)
	(setq extensions-list better-editing-header-files)))

  (if (equal extensions-list nil)
      (message "better-editing/header-swap: Does not support the file extension %s: "
	       file-extensions)
    (progn
      (setq exit nil)
      (while (and extensions-list (not exit))
	(setq extension (car extensions-list))
	(setq file (concat file-name (format ".%s" extension)))
	(if (file-exists-p file)
	    (progn
	      (setq exit t)
	      (find-file file))
	  (message "better-editing/header-swap: File doesn't exist: %s" file))
	(setq extensions-list (cdr extensions-list))))))

(provide 'better-editing)
