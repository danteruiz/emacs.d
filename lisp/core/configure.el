;; configure emacs file
;;
;;
(require 'utils)
(require 'package)
(require 'keybindings)
(require 'major-modes)
(require 'better-editing)
(require 'my-auto-complete)
(require 'projects)
(require 'benchmark-init-loaddefs)
(require 'file-template)

(defvar layer-directory (concat start-directory "lisp/layers/"))

(defvar elpa-archives
  '(("mepla" . "melpa.org/packages/")
    ;;("org" . "orgmode.org/elpa")
    ("gnu" . "elpa.gnu.org/packages/")))

(defun configure/emacs-defaults ()
  (configure/windows-special-settings)
  (setq load-prefer-newer t)
  (defvar elpa-https nil)
  (defvar emacs-insecure t)

  (configure/remove-ui-elements)
  (configure/mouse-style)
  (configure/backup-files)

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
  (setq user-full-name "Dante Ruiz")

  (configure/archive-packages) 
  ;;(configure/load-user-config-file)
  ;;(configure/load-layers my-layers)
  (configure/start-emacs-server)
  (configure/load-custom-theme)
  (configure/hack-font))

(defun configure/hack-font ()
  (when (member "Hack" (font-family-list))
    (set-face-attribute 'default nil :height 120 :font "Hack")))

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
  ;;(package-refresh-contents)
  (configure/initialize-use-package))

(defun configure/initialize-use-package ()
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (eval-when-compile
    (require 'use-package)))

(defun configure/load-custom-theme ()
  (setq spacemacs-theme-comment-bg nil)
  (load-theme 'gruvbox-dark-hard t))

(defun configure/start-emacs-server ()
  (if (and (fboundp 'server-running-p)
           (not (server-running-p)))
      (server-start)))

(defun configure/major-modes ()
  (major-mode/elisp)
  (major-mode/cpp)
  (major-mode/org)
  (major-mode/shaders)
  (major-mode/cmake)
  (major-mode/qt))

(defun configure/projects ()
  (projects/setup-projectile)
  (bind-prefix-keys 'leader-prefix-map
		    "hp" 'template/personal-file-header)
  (bind-prefix-keys 'leader-prefix-map
		    "hw" 'template/work-file-header))

(defun configure/windows-special-settings ()
  (when (system-is-windows)
    (setq default-directory (getenv "HOME"))))

(defun configure/text-editing ()
  (better-editing/whitespace)
  (better-editing/move-text)
  (better-editing/long-lines)
  (global-set-key (kbd "C-c s") 'better-editing/header-swap))


(defun configure/auto-complete ()
  (auto-complete/init-company)
  (auto-complete/init-auto-complete))

(defun configure/syntax-checking ()
  (use-package flycheck
    :ensure t
    :defer t))

(provide 'configure)
