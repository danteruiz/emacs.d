(setq load-prefer-newer t)


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
;; emacs window configuration
(when (featurep 'menu-bar) (menu-bar-mode -1))

(when (featurep 'tool-bar) (tool-bar-mode -1))

(blink-cursor-mode -1)

(when (featurep 'scroll-bar) (scroll-bar-mode -1))

(setq inhibit-startup-screen t)
(setq ring-bell-function #'ignore)
(setq initial-scratch-message "")

(setq visible-bell t)

(defalias 'yes-or-no-p 'y-or-n-p)

(prefer-coding-system 'utf-8)
(setq system-time-locale "en_US")

(require 'package)
(defvar elpa-archives
  '(("mepla" . "melpa.org/packages/")
    ("org" . "orgmode.org/elpa")
    ("gnu" . "elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'rainbow))

(eval-when-compile
  (require 'use-package))

(load-file (concat (file-name-directory load-file-name)
                   "lisp/libraries/load-paths.el"))

(require 'utils)

(add-to-list 'load-path (concat start-directory "themes/"))


(defun ajt-eslint ()
  (interactive)
  (shell-command (concat "eslint -f unix " (buffer-file-name)) "*eslint-log*")
  (pop-to-buffer "*eslint-log*")
  (compilation-mode))

(load-file (concat start-directory "lisp/layers/c-c++.el"))
(load-file (concat start-directory "lisp/layers/qml.el"))
(load-file (concat start-directory "lisp/layers/better-editing.el"))
(load-file (concat start-directory "lisp/layers/source-control.el"))
(load-file (concat start-directory "lisp/layers/slack.el"))

(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))

(add-to-list 'custom-theme-load-path (concat start-directory "themes/"))

;; js mode hook
(add-hook 'js-mode-hook
	  '(lambda ()
	     (setq tab-width 4)
	     (setq indent-tabs-mode nil)
	     ))

(load-theme 'adwaita t)
(setq default-directory "C:Users/dante/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-safe-themes
   (quote
    ("5fcfc915b3247c9c40535faa2790cc752e434fbc4a63bba95b4f8c16589dce47" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "6adf7cfcacbc378a3ed60814a1b51a6120884c7a06b58a378a700423babff9af" "b099685963c251fb3ed5dd60237bda3390a11372221dfc9d168aa54e7b1c252e" "004434f2ad49ce8f4913896206ef6c91fd29a963a0d2f090b6170f3154b51701" "787a4b6fa234a3b85eb278f423f03c325372db6fcc41f0c537752549e0042812" default)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(package-selected-packages
   (quote
    (rainbow-mode magit with-editor use-package solarized-theme magit-popup let-alist)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
