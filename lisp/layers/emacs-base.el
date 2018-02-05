;;
;; emacs-base configureation files
;;
(require 'use-package)


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

    (add-hook 'prog-mode-hook 'emacs/show-trailing-whitespace)
    )
  )
