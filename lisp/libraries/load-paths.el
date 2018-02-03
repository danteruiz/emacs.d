(defun add-to-load-path (dir) (add-to-list 'load-path dir))

(defun add-to-load-path-if-exits (dir)
  (when (file-exists-p)
    (add-to-load-path dir)))

(defvar start-directory
  user-emacs-directory)

(defconst lisp-directory
  (expand-file-name (concat start-directory "lisp/")))

(defconst lib-directory
  (expand-file-name (concat lisp-directory "libraries/")))

(mapc 'add-to-load-path
      `(
        ,lib-directory))

(add-to-list 'load-path (concat start-directory "themes/"))
