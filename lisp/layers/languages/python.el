;; python.el
;;
;; Created on 2022/03/24 by Dante Ruiz
;; Copyright 2022 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/

(defun python-hook ()
  (elpy-enable)
  (flycheck-mode))

(use-package elpy
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'python-mode-hook 'python-hook)))
