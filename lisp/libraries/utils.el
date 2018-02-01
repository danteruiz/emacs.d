(defun system-is-windows ()
  (eq system-type 'windows-nt))
(defun system-is-linux ()
  (eq system-type 'gnu/linux))
(defun system-is-mac ()
  (eq system-type 'darwin))

(defun install-packages (list)
  ;; fetch list of packages avilable
  (unless package-archive-contents
    (package-refresh-contents))

  (dolist (package list)
    (unless (package-installed-p package)
      (package-install package))))

(provide 'utils)
