(require 'ox-latex)

(defun org-file-path (filename)
      (concat (file-name-as-directory org-directory) filename))


(use-package org-bullets
  :ensure t)

(use-package org-modern
  :ensure t)

(use-package org-jira
  :ensure t)

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . visual-line-mode)
	 (org-mode . org-bullets-mode))
  :after (org-modern org-bullets)
  :init
  (progn
    ;; org-mode keybindings
    (define-key global-map "\C-cc" 'org-capture)
    (global-set-key "\C-ca" 'org-agenda)

    ;; styling configurations
    (setq org-hide-emphasis-markers t)

    (font-lock-add-keywords 'org-mode
                            '(("^ *\\([-]\\) "
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


    ;; font sytle changes
    (custom-theme-set-faces
     'user
     '(org-block ((t (:inherit fixed-pitch))))
     '(org-code ((t (:inherit (shadow fixed-pitch)))))
     '(org-document-info ((t (:foreground "dark orange"))))
     '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
     '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
     '(org-link ((t (:foreground "royal blue" :underline t))))
     '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
     '(org-property-value ((t (:inherit fixed-pitch))) t)
     '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
     '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
     '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
     '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

    (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

      (custom-theme-set-faces
       'user
       `(org-level-8 ((t (,@headline ,@variable-tuple))))
       `(org-level-7 ((t (,@headline ,@variable-tuple))))
       `(org-level-6 ((t (,@headline ,@variable-tuple))))
       `(org-level-5 ((t (,@headline ,@variable-tuple))))
       `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
       `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
       `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
       `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
       `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))


    (custom-theme-set-faces
     'user
     '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
     '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))



    ;; TODO make org-directory configurable
    (setq org-directory "~/org/"
	  org-log-done 'time
	  org-index-file (org-file-path "todo.org")
	  org-adapt-indentation t
	  org-hide-leading-stars t
	  org-pretty-entities t
	  org-ellipis "   .")

    (setq org-src-fontify-natively t
	  org-src-tabs-acts-natively t
	  org-edit-src-content-indentation 0)))

    ;; (setq org-archive-location
    ;; 	  (concat (org-file-path "archive.org") "::* From %s"))

    ;; make these configurable
    ;; (setq org-agenda-files (list org-index-file
    ;; 				 (org-file-path "events.org")
    ;; 				 (org-file-path "habits.org")
    ;; 				 (org-file-path "recurring-events.org")
    ;; 				 (org-file-path "work.org")))
    ;; 
    ;; (setq org-capture-templates
    ;; 	  '(("b" "Blog idea" entry (file "~/org/blog-ideas.org")
    ;; 	     "* %?\n")
    ;; 
    ;; 	    ("f" "Finished book"
    ;; 	     table-line (file "~/org/notes/books-read.org")
    ;; 	     "| %^{Title} | %^{Author} | %u |")
    ;; 
    ;; 	    ("t" "todo" entry (file+headline org-index-file "Inbox")
    ;; 	     "* TODO %?\n")))
    ;; 
    ;; (setq org-agenda-files (quote ("~/org/")))))


;; (use-package ox-hugo
;;   :ensure t
;;   :after ox)
