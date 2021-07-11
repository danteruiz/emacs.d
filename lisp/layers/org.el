
(use-package org
  :init
  (progn
    (define-key global-map "\C-cc" 'org-capture)
    (add-to-list 'auto-mode-alist '("\\.org'" . org-mode))
    (setq org-directory "~/org/")
    (setq org-log-done 'time)

    (global-set-key "\C-ca" 'org-agenda)

    (defun org-file-path (filename)
      (concat (file-name-as-directory org-directory) filename))

    (setq org-index-file (org-file-path "todo.org"))
    (setq org-archive-location
	  (concat (org-file-path "archive.org") "::* From %s"))

    (require 'org-habit)
    (defun org-habit-build-graph (habit starting current ending)
      "                             ")
    (setq org-habit-graph-column 60)

    (setq org-agenda-files (list org-index-file
				 (org-file-path "events.org")
				 (org-file-path "habits.org")
				 (org-file-path "recurring-events.org")
				 (org-file-path "work.org")))

    (setq org-capture-templates
	  '(("b" "Blog idea" entry (file "~/org/blog-ideas.org")
	     "* %?\n")

	    ("f" "Finished book"
	     table-line (file "~/org/notes/books-read.org")
	     "| %^{Title} | %^{Author} | %u |")

	    ("t" "todo" entry (file+headline org-index-file "Inbox")
	     "* TODO %?\n")))

    (setq org-agenda-files (quote ("~/org/")))))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

(setq org-export-coding-system 'utf-8)

;;configure org mode
(use-package ox-hugo
  :ensure t
  :after ox)
