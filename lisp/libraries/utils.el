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

(defun add-to-mode (mode lst)
  (dolist file lst)
  (add-to-list 'auto-mode-alist (cons file mode)))

(provide 'utils)
