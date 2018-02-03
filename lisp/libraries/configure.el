;;
;; configure emacs file
;;
(require 'utils)
(require 'package)

(defvar elpa-archives
  '(("mepla" . "melpa.org/packages/")
    ("org" . "orgmode.org/elpa")
    ("gnu" . "elpa.gnu.org/packages/")))

(defun configure/initialize ()
  (configure/remove-ui-elements)
  (configure/mouse-style)
  (configure/backup-files)

  (setq inhibit-startup-screen t)
  (setq ring-bell-function #'ignore)
  (setq initial-scratch-message "")
  ;; extra things
  (defalias 'yes-or-no-p 'y-or-n-p)
  (setq visible-bell t)
  (prefer-coding-system 'utf-8)
  (setq system-time-locale "en_US")
  )

(defun configure/remove-ui-elements ()
  (when (featurep 'menu-bar) (menu-bar-mode -1))
  (when (featurep 'tool-bar) (tool-bar-mode -1))
  (when (featurep 'scroll-bar) (scroll-bar-mode -1))
  )

(defun configure/mouse-style ()
  (blink-cursor-mode t)
  )

(defun configure/backup-files ()

  (defconst user-cache-directory
    (file-name-as-directory (concat user-emacs-directory ".cache"))
    "My emacs storage area for persistent files.")
  ;; create the `user-cache-directory' if not exists
  (make-directory user-cache-directory t)
  
  (let ((backup-dir (concat user-cache-directory "backup")))
    ;; Move backup file to `~/.emacs.d/.cache/backup'
    (setq backup-directory-alist `(("." . ,backup-dir)))
    ;; Makesure backup directory exist
    (when (not (file-exists-p backup-dir))
      (make-directory backup-dir t)))

  (setq delete-by-moving-to-trash nil)
  (setq version-control t)
  (setq kept-old-versions 10)
  (setq kept-new-versions 20)
  (setq delete-old-versions t)
  (setq backup-by-copying t)
  (setq auto-save-default nil)
)

(provide 'configure)
