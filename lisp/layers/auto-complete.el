;; auto-complete
(defvar auto-complete-packages
  '(
    auto-complete
    company
    yasnippet
    auto-yasnippet
    ))

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
	  campany-dabbrev-downcase nil))
  (add-hook 'company-completion-started-hook 'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci))


