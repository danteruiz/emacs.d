(defun system-is-windows ()
  (eq system-type 'windows-nt))
(defun system-is-linux ()
  (eq system-type 'gnu/linux))
(defun system-is-mac ()
  (eq system-type 'darwin))

(defun install-packages (list)
  (dolist (package list)
    (unless (package-installed-p package)
      (message "installing package..." package)
      (package-install package))))

(provide 'utils)
