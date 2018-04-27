(defvar source-control-packages
  '(
    magit
    magit-gitflow
    git-gutter
    git-gutter+
    git-gutter-fringe
    git-gutter-fringe+))


(install-packages source-control-packages)

;;(defface git-gutter+-added
;;  '((t (:foreground "green" :weight bold)))
;;  :group 'git-gutter+)

;;(defface git-gutter+-deleted
;; '((t (:foreground "red" :weight bold)))
;;  :group 'git-gutter+)

;;(defface git-gutter+-modified
;;  '((t (:foreground "magenta" :weight bold)))
;;  "face for modified lines"
;;  :group 'git-gutter+)

(use-package git-gutter+
  :commands (global-git-gutter+-mode git-gutter+-mode)
  :init
  (progn
    (add-hook 'magit-pre-refresh-hook 'git-gutter+-mode)
    (global-git-gutter+-mode t)
    (setq
     git-gutter+-modified-sign " "
     git-gutter+-added-sign "+"
     git-gutter+-deleted-sign "-"
     git-gutter+-diff-option "-w"
     git-gutter+-hide-gutter t)))
