;;
;; emacs-base configureation files
;;
(require 'use-package)

(defvar emacs-base-packages
  '(
    projectile
    ivy
    counsel-projectile
    undo-tree
    which-key
    ))

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
  :init
  (progn
    (setq projectile-globally-ignored-directories
	  (append
	   '(
	     "build"
	     ".git"
	     ".meta"
	     "x64"
	     "andriod"
	     "server-console"
	     "ice-server"
	     "compiledResources"
	     "external"
	     "i18n"
	     "icon"
	     "ui"
	     "fonts"
	     "icons"
	     "meshes"
	     "sounds"
	     "snapshot"
	     "images"
	     "mention-sounds"
	     "visage")))
    )
  :config
  (progn
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (counsel-projectile-mode)))


(use-package undo-tree
  :init
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t))

(use-package which-key
  :config
  (progn
    (which-key-mode)))

(defun reload-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-set-key [f12] 'reload-init)
