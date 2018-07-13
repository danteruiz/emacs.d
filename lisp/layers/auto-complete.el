;; auto-complete
(setq auto-complete-packages
  '(
    auto-complete
    company
    yasnippet
    auto-yasnippet
    ))

(install-packages auto-complete-packages)
(use-package auto-complete
  :defer t
  :init
  (setq ac-autos-start 0
	ac-delay 0.2
	ac-quick-help-delay 1.
	ac-use-fuzzy t
	ac-enable-fuzzy t
	tab-always-indent 'complete
	ac-dwin t))


(use-package company
  :defer t
  :init
  (progn
    (setq company-idle-delay 0.2
	  company-minimum-prefix-length 2
	  company-require-match nil
	  company-dabbrev-ignore-case nil
	  campany-dabbrev-downcase nil)))


(defun auto-complete/init-company ()
  (message "auto-complete/init-comapny"))

(defun auto-complete/init-auto-complete ()
  (message "auto-complete/init-auto-complete"))

(defun auto-complete/init-yasnippet ()
  (message "auto-comeplete/init-yasnippet"))

(defun auto-complete/init-auto-yasnippet ()
  (message "auto-complete/init-auto-yasnippet"))
