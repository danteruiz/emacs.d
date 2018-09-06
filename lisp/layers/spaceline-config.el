;; spaceline.el
(require 'utils)
(defvar spaceline-packages-config '(all-the-icons
				    spaceline-all-the-icons))

(install-packages spaceline-packages-config)

(use-package all-the-icons
  :config (all-the-icons-install-fonts))


(use-package spaceline-all-the-icons
  :after spaceline
  :config
  (progn
    (setq spaceline-all-the-icons-icon-set-modified 'toggle)))
