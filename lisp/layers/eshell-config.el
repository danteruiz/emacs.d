;; my eshell config
(defun eshell/custom-prompt ()
  )

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
    (message "initialize")))
