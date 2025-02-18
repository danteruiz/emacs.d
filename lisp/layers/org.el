(require 'ox-latex)

(defun org-file-path (filename)
      (concat (file-name-as-directory org-directory) filename))

(use-package olivetti
  :ensure t)

(use-package org-bullets
  :ensure t)

(use-package org-modern
  :ensure t)

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . visual-line-mode)
	 (org-mode . org-modern-mode)
	 (org-mode . olivetti-mode))
  :after (olivetti org-modern)
  :init
  (progn
    ;; org-mode keybindings

    (define-key global-map "\C-cc" 'org-capture)
    (global-set-key "\C-ca" 'org-agenda)
    (setq org-directory "~/org/"
	  org-log-done 'time
	  org-index-file (org-file-path "todo.org")
	  org-adapt-indentation t
	  org-hide-leading-stars t
	  org-pretty-entities t
	  org-ellipis "   .")

    (setq org-src-fontify-natively t
	  org-src-tabs-acts-natively t
	  org-edit-src-content-indentation 0)

    ;; (setq org-archive-location
    ;; 	  (concat (org-file-path "archive.org") "::* From %s"))

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


;; (use-package ox-hugo
;;   :ensure t
;;   :after ox)
