;; auto-complete.el
;;
;; Created on 2021/08/22 by Dante Ruiz
;; Copyright 2021 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

(use-package company
  :ensure t
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
	("C-p". company-select-previous)
	("M-<". company-select-first)
	("M->". company-select-last)))
