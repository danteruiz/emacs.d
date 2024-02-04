(require 'ox-latex)
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

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

;; (add-to-list 'org-latex-classes
;;              '("koma-article" "\\documentclass{scrartcl}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; 
;; (setq org-latex-listings 'minted
;;       org-latex-packages-alist '(("" "minted"))
;;       org-latex-minted-options '(("breaklines" "true")
;;                                  ("breakanywhere" "true")
;;                                  ("mathescape")
;;                                  ("frame" "lines")
;;                                  ("bgcolor" "yellow!5")))
;; 
;; (setq org-latex-default-packages-alist
;;       '(("AUTO" "inputenc" t
;;          ("pdflatex"))
;;         ("T1" "fontenc" t
;;          ("pdflatex"))
;;         ("" "graphicx" t)
;;         ("" "grffile" t)
;;         ("" "longtable" nil)
;;         ("" "wrapfig" nil)
;;         ("" "rotating" nil)
;;         ("normalem" "ulem" t)
;;         ("" "amsmath" t)
;;         ("" "textcomp" t)
;;         ("" "amssymb" t)
;;         ("" "capt-of" nil)
;;         ("dvipsnames" "xcolor" nil)
;;         ("colorlinks=true, linkcolor=Blue, citecolor=BrickRed, urlcolor=PineGreen" "hyperref" nil)
;; 	("" "indentfirst" nil)))


(add-to-list 'org-latex-classes
             '("altacv" "\\documentclass[10pt,a4paper,ragged2e,withhyper]{altacv}

% Change the page layout if you need to
\\geometry{left=1.25cm,right=1.25cm,top=1.5cm,bottom=1.5cm,columnsep=1.2cm}

% Use roboto and lato for fonts
\\renewcommand{\\familydefault}{\\sfdefault}

% Change the colours if you want to
\\definecolor{SlateGrey}{HTML}{2E2E2E}
\\definecolor{LightGrey}{HTML}{666666}
\\definecolor{DarkPastelRed}{HTML}{450808}
\\definecolor{PastelRed}{HTML}{8F0D0D}
\\definecolor{GoldenEarth}{HTML}{E7D192}
\\colorlet{name}{black}
\\colorlet{tagline}{PastelRed}
\\colorlet{heading}{DarkPastelRed}
\\colorlet{headingrule}{GoldenEarth}
\\colorlet{subheading}{PastelRed}
\\colorlet{accent}{PastelRed}
\\colorlet{emphasis}{SlateGrey}
\\colorlet{body}{LightGrey}

% Change some fonts, if necessary
\\renewcommand{\\namefont}{\\Huge\\rmfamily\\bfseries}
\\renewcommand{\\personalinfofont}{\\footnotesize}
\\renewcommand{\\cvsectionfont}{\\LARGE\\rmfamily\\bfseries}
\\renewcommand{\\cvsubsectionfont}{\\large\\bfseries}

% Change the bullets for itemize and rating marker
% for \cvskill if you want to
\\renewcommand{\\itemmarker}{{\\small\\textbullet}}
\\renewcommand{\\ratingmarker}{\\faCircle}
"

               ("\\cvsection{%s}" . "\\cvsection*{%s}")))

(setq org-latex-pdf-process
      '("latexmk -pdflatex='%latex -shell-escape -interaction nonstopmode' -pdf -output-directory=%o -f %f"))
;;configure org mode
(use-package ox-hugo
  :ensure t
  :after ox)
