;; org mode config

;;(add-to-list 'load-path (expand-file-name "~/github/org-mode/lisp"))
;;(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;(require 'org)

(defvar org-mode-packages
  `(org-projectile))

(use-package org
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.org'" . org-mode))
    (setq org-agenda-files (quote ("~/org/")))))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
