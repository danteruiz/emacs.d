;; my eshell config
(require 'eshell)
(require 'em-smart)
(defun eshell/custom-prompt ()
  )

(use-package eshell
  :defer t
  :config
  (progn
    (setq eshell-where-to-jump 'begin)
    (setq eshell-review-quick-commands nil)
    (setq eshell-smart-space-goes-to-end t)
    (message "Configuring"))

  :init
  (progn
    (message "intiial eshell")))
