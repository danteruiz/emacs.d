(require 'use-package)

(defvar emacs-base-packages
  '(projectile
    ivy
    counsel-projectile))

(install-packages emacs-base-packages)
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
	(setq whitespace-style '(face trailing tabs spaces))
	(setq show-trailing-whitespace t)))

    (add-hook 'prog-mode-hook 'emacs/show-trailing-whitespace)))

(use-package counsel-projectile
  :ensure t
  :init
  (progn
    (setq projectile-globally-ignored-directories
	  (append ignored-directories))

    (setq projectile-globally-ignored-files
	  (append ignored-files)))
  :config
  (progn
    (define-key projectile-mode-map (kbd projectile-leader-key) 'projectile-command-map)
    (counsel-projectile-mode)))

(defun reload-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))



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

(add-hook 'prog-mode-hook (lambda () (interactive)
			    (column-marker-1 max-column-length)))
(setq column-enforce-column max-column-length)
(add-hook 'prog-mode-hook 'column-enforce-mode)

(use-package move-text
  :ensure t)

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; swap header between header and source files
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
	      (find-file file)))

	(setq extensions-list (cdr extensions-list))))))

(defun template/insert-file-header (file)
  (interactive)
  (setq begin (point))
  (setq count-before (1- (point-max)))
  (insert-file file)
  (goto-char (point-min))
  (let ((the-list template-replacement-alist))
    (while the-list
      (goto-char (point-min))
      (replace-string (car (car the-list))
		      (funcall (cdr (car the-list)))
		      nil)
      (setq the-list (cdr the-list))))
  (setq count-after (1- (point-max)))
  (setq total-characters (- count-after count-before))
  (setq end (+ begin total-characters))
  (comment-region begin end)
  (whitespace-cleanup-region begin end)
  (goto-char (point-min)))


(defun template/personal-file-header ()
  (interactive)
  (template/insert-file-header
   (concat template-directory template-header-file)))


(bind-prefix-keys 'leader-prefix-map
		  "h" 'template/personal-file-header)




(global-set-key (kbd header-swap) 'better-editing/header-swap)
(global-set-key [f12] 'reload-init)
