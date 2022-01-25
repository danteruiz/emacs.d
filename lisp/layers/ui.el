;; ui.el
;;
;; Created on 2022/01/25 by Dante Ruiz
;; Copyright 2022 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :config
  (progn
    (setq doom-modeline-height 12))
  :init (doom-modeline-mode 1))
