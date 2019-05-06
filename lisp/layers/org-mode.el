;; org mode config

;;(add-to-list 'load-path (expand-file-name "~/github/org-mode/lisp"))
;;(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;(require 'org)


(use-package org
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.org'" . org-mode))
    (setq org-agenda-files (quote ("~/github/orgfiles")))))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
