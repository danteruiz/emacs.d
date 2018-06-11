;; my eshell config
(defun eshell/custom-prompt ()
  )




(defun eshell-hook ()
  (eshell/alias "clear" "clear t"))


(use-package eshell
  :defer t
  :config
  (progn
    (ansi-color-for-comint-mode-on)
    (add-hook 'eshell-preoutput-filter-functions
	      'ansi-color-filter-apply)
    (message "Configuring"))

  :init
  (progn
    (message "intiial eshell configuration")
    (setq eshell-scroll-to-bottom-on-input 'all
	  eshell-error-if-no-glob t
	  eshell-hist-ignoredups t
	  eshell-save-history-on-exit t
	  eshell-prefer-lisp-functions nil)

    (add-hook 'eshell-mode-hook 'eshell-hook)
    ))
