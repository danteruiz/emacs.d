;; auto-complete
(defvar auto-complete-packages
  '(auto-complete
    company
    yasnippet
    auto-yasnippet))
;;(install-packages auto-complete-packages)
;;(use-package auto-complete
;;:defer t
;;:init
;;(setq ac-autos-start 0
;;	ac-delay 0.2
;;	ac-quick-help-delay 1.
;;	ac-use-fuzzy t
;;	ac-enable-fuzzy t
;;	tab-always-indent 'complete
;;	ac-dwin t))

(use-package company
  :defer t
  :ensure t
  :init
  (progn
    (setq company-idle-delay 0.2
	  company-minimum-prefix-length 2
	  company-require-match nil
	  company-dabbrev-ignore-case nil
	  campany-dabbrev-downcase nil)))

(defun auto-complete/init-company ()
  (use-package company
    ;;:defer t
    :ensure t
    :init
    (progn
      (setq company-idle-delay 0.2
	    company-minimum-prefix-length 2
	    company-require-match nil
	    company-dabbrev-ignore-case nil
	    campany-dabbrev-downcase nil))))

(defun auto-complete/init-auto-complete ()
  (use-package company
    :ensure t
    :custom
    (company-idle-delay 0.5)
    :bind
    (:map company-active-map
	  ("C-n". company-select-next)
	  ("C-p". company-select-pervious)
	  ("M-<". company-select-first)
	  ("M->". company-select-last))))

(defun auto-complete/init-yasnippet ()
  (message "auto-comeplete/init-yasnippet"))

(defun auto-complete/init-auto-yasnippet ()
  (message "auto-complete/init-auto-yasnippet"))
