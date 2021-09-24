;; auto-complete.el
;;
;; Created on 2021/08/22 by Dante Ruiz
;; Copyright 2021 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

(use-package company
  :ensure t
  :init
  (progn
    (setf company-backends '())
    (add-to-list 'company-backends 'company-keywords)
    (add-to-list 'company-backends 'company-irony)
    (add-to-list 'company-backends 'company-irony-c-headers))

  :config
  (progn
    (setq company-idle-delay 0.2
	  company-minimum-prefix-length 2
	  company-require-match nil
	  company-dabbrev-ignore-case nil
	  campany-dabbrev-downcase nil))
  :bind
  (:map company-active-map
	("C-n". company-select-next)
	("C-p". company-select-pervious)
	("M-<". company-select-first)
	("M->". company-select-last)))

(use-package auto-complete-clang
  :ensure t)

(use-package irony
  :ensure t)


(use-package rtags
  :ensure t
  :hook (c++-mode . rtags-start-process-unless-running)
  :config (setq rtags-completions-enabled t
		rtags-rc-binary-name "/home/dante/packages/rtags/build/bin/rc"
		rtags-use-helm nil
		rtags-rdm-binary-name
		"/home/dante/packages/rtags/build/bin/rdm"))

(use-package cmake-ide
  :ensure t
  :config
  (progn
    (cmake-ide-setup)
    (bind-prefix-keys 'leader-prefix-map "ca" 'cmake-ide-compile)
    (company-mode)))
