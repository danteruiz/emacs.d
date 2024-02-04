;;; package --- Summary
;;;
;;; shell.el ---
;;
;;; Commentary:
;; Created on 2023/04/07 by Enter Your Name Here
;; Copyright 2023 Enter Your Name Here
;;
;; Distributed under the MIT Lisense
;; https://mit-license.org/
;;
;;; Code:

(require 'common)

(use-package fish-completion
  :ensure t
  :hook (fish-mode . fish-completion-mode))

(use-package fish-mode
  :ensure t
  :mode "\\.fish\\'")

(use-package sh-mode
  :mode "\\.sh\\'"
  :hook (sh-mode . copilot-mode))




;;; shell.el ends here
