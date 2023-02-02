;; ; protobuf.el ---
;;
;; ; Commentary:
;; Created on 2023/01/13 by Dante Ruiz
;; Copyright 2023 Dante Ruiz
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/
;;
;; ; Code:
;; 
;;

(defun protobuf-hook ()
  (setq tab-with 4))

(use-package protobuf-mode
  :ensure t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
    (add-hook 'protobuf-mode-hook 'protobuf-hook)))

;; ; protobuf.el ends here
