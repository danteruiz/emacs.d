(require 'utils)
(require 'keybindings)
(require 'package)
(require 'benchmark-init-loaddefs)


(defvar layer-directory (concat start-directory "lisp/layers/"))

(defvar elpa-archives
  '(("mepla" . "melpa.org/packages/")
    ("gnu" . "elpa.gnu.org/packages/")))


(defun configure/emacs-defaults ()
  (configure/windows-special-settings)
  (configure/get-system-enviroment)
  (configure/load-custom-theme)
  (configure/set-font)
  (setq load-prefer-newer t)
  (defvar elpa-https nil)
  (defvar emacs-insecure t)
  (configure/remove-ui-elements)
  (configure/mouse-style)
  (configure/backup-files)
  (setq comment-empty-lines t)
  (setq comment-style 'extra-line)
  ;;(global-hl-line-mode 1)

  (setq inhibit-startup-screen t)
  (setq ring-bell-function #'ignore)
  (setq initial-scratch-message "")
  '(inhibit-double-buffering . t)

  (defalias 'yes-or-no-p 'y-or-n-p)
  (setq visible-bell t)
  (prefer-coding-system 'utf-8)
  (setq system-time-locale "en_US")
  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file 'noerror)
  (setq column-number-mode t)

  (configure/archive-packages)
  (configure/start-emacs-server))

(defun configure/set-font ()
  (set-face-attribute 'default nil :height font-size)
  (when (member font-type (font-family-list))
    (set-face-attribute 'default nil :font font-type)))

(defun configure/remove-ui-elements ()
  (when (featurep 'menu-bar) (menu-bar-mode -1))
  (when (featurep 'tool-bar) (tool-bar-mode -1))
  (when (featurep 'scroll-bar) (scroll-bar-mode -1)))

(defun configure/mouse-style ()
  (blink-cursor-mode t))

(defun configure/backup-files ()
  (defconst user-cache-directory
    (file-name-as-directory (concat user-emacs-directory ".cache"))
    "My emacs storage area for persistent files.")
  ;; create the `user-cache-directory' if not exists
  (make-directory user-cache-directory t)

  (let ((backup-dir (concat user-cache-directory "backup")))
    ;; Move backup file to `~/.emacs.d/.cache/backup'
    (setq backup-directory-alist `((".*" . ,backup-dir)))
    ;; Makesure backup directory exist
    (when (not (file-exists-p backup-dir))
      (make-directory backup-dir t)))

  (setq delete-by-moving-to-trash nil)
  (setq version-control t)
  (setq kept-old-versions 2)
  (setq kept-new-versions 6)
  (setq delete-old-versions t)
  (setq create-lockfiles nil)
  (setq backup-by-copying t)
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (global-auto-revert-mode 1))

(defun configure/package-archive-absolute-pathp (archive)
  (let ((path (cdr archive)))
    (or (string-match-p "http" path)
        (string-prefix-p "~" path)
        (string-prefix-p "/" path))))

(defun configure/resolve-package-archives (archives)
  (mapcar
   (lambda (x)
     (let ((aname (car x))
	   (apath (cdr x)))
       (cons aname
	     (if (configure/package-archive-absolute-pathp x)
		 apath
	       (concat
		(if (and elpa-https
			 (not emacs-insecure)
			 (not (equal "org" aname)))
		    "https://"
		  "http://")
		apath)))))
   archives))

(defun configure/archive-packages ()
  (setq package-archives (configure/resolve-package-archives
			  elpa-archives))
  (setq package-enable-at-startup nil)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  (configure/initialize-use-package))

(defun configure/initialize-use-package ()
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (eval-when-compile
    (require 'use-package)))

(defun configure/load-custom-theme ()
  (when (not (is-system-window-nil))
    (set-frame-parameter nil 'background-mode 'dark))
  (load-theme my-theme t))

(defun configure/start-emacs-server ()
  (unless (and (fboundp 'server-running-p)
           (not (server-running-p)))
      (server-start)))

(defun configure/windows-special-settings ()
  (when (system-is-windows)
    (setq default-directory (getenv "HOME"))))

(defun configure/syntax-checking ()
  (use-package flycheck
    :ensure t
    :defer t))
(provide 'configure)

(defun configure/load-layers (my-layers)
  (setq files (delete "." (delete ".." (directory-files
					(concat start-directory
						"lisp/layers/")))))
  (dolist (layer my-layers)
    (setq file (concat (format "%s" layer) ".el"))
    (setq file-path (concat layer-directory file))
    (when (file-exists-p file-path)
      (load-file file-path))))

(defun configure/load-user-config-file ()
  (defvar my-layers-file (concat start-directory "my-layers.el"))
  (when (not (file-exists-p my-layers-file))
    (copy-file (concat template-directory ".my-emacs.template") my-layers-file))

  (load-file my-layers-file))

(defun configure/get-system-enviroment ()
  (let ((vcpkg-root (shell-command-to-string
		     "source ~/.bash_profile; echo -n $VCPKG_ROOT")))
    (setenv "VCPKG_ROOT" vcpkg-root)
    (message vcpkg-root))

  (let ((lib-clang (shell-command-to-string
		     "source ~/.bash_profile; echo -n $LIBCLANG_LLVM_CONFIG_EXECUTABLE")))
    (setenv "LIBCLANG_LLVM_CONFIG_EXECUTABLE" lib-clang)
    (message lib-clang)))

