;; org mode config

;;(add-to-list 'load-path (expand-file-name "~/github/org-mode/lisp"))
;;(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;(require 'org)


(use-package org
  :config
  (progn
    (bind-keys* :map global-map
	       :prefix-map my-prefix-map
	       :prefix "M-m"
	       ("ol" . org-store-link)
	       ("oa" . org-agenda)
	       ("ob" . org-iswitchb))))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files (quote ("~/git/orgfiles")))
