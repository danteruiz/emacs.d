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

(defconst template-directory
  (expand-file-name (concat start-directory "templates/")))

(defconst core-directory
  (expand-file-name (concat lisp-directory "core/")))

(mapc 'add-to-load-path
      `(,lisp-directory
        ,lib-directory
	,core-directory))

(add-to-list 'load-path (concat start-directory "themes/"))
(add-to-list 'custom-theme-load-path (concat start-directory "themes/"))
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
