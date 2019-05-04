(defvar source-control-packages
  '(magit
    magit-gitflow
    git-timemachine
    git-messenger
    git-link
    orgit
    git-gutter
    git-gutter+
    git-gutter-fringe
    git-gutter-fringe+))


(install-packages source-control-packages)

(use-package magit
  :config
  (progn
    (bind-keys* :map global-map
	       :prefix-map my-prefix-map
	       :prefix "M-m"
	       ("gs" . magit-status)
	       ("gb" . magit-blame-addition))))

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

(use-package git-gutter-fringe+
  :commands git-gutter+-mode
  :init
  (progn
    (with-eval-after-load 'git-gutter+
      (require 'git-gutter-fringe+))
    (setq git-gutter-fr+-side 'right-fringe))
  :config
  (progn
    (fringe-helper-define 'git-gutter-fr+-added nil
        "..X...."
        "..X...."
        "XXXXX.."
        "..X...."
        "..X...."
        )
      (fringe-helper-define 'git-gutter-fr+-deleted nil
        "......."
        "......."
        "XXXXX.."
        "......."
        "......."
        )
      (fringe-helper-define 'git-gutter-fr+-modified nil
        "..X...."
        ".XXX..."
        "XX.XX.."
        ".XXX..."
        "..X....")))
