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

(blink-cursor-mode -1)

(setq ring-bell-function #'ignore)

(setq initial-scratch-message "")

(setq visible-bell t)

(defalias 'yes-or-no-p 'y-or-n-p)

(prefer-coding-system 'utf-8)
(setq system-time-locale "en_US")

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))


;; Add these to the PATH so that proper executables are found
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/texbin")))
(setq exec-path (append exec-path '("/usr/bin")))
(setq exec-path (append exec-path '("/usr/local/bin")))

(package-initialize)
;; list the packages you want
(defvar package-list)
(setq package-list '(doom-themes moe-theme qml-mode))
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(defun dts-switch-between-header-and-source ()
  "Switch between a c/c++ header (.h) and its corresponding source (.c/.cpp)."
  (interactive)
  ;; grab the base of the current buffer's file name
  (setq bse (file-name-sans-extension buffer-file-name))
  ;; and the extension, converted to lowercase so we can
  ;; compare it to "h", "c", "cpp", etc
  (setq ext (downcase (file-name-extension buffer-file-name)))
  ;; This is like a c/c++ switch statement, except that the
  ;; conditions can be any true/false evaluated statement
  (cond
   ;; first condition - the extension is "h"
   ((equal ext "h")
    ;; first, look for bse.c
    (setq nfn (concat bse ".c"))
    (if (file-exists-p nfn)
	;; if it exists, either switch to an already-open
	;;  buffer containing that file, or open it in a new buffer
	(find-file nfn)
      ;; this is the "else" part - note that if it is more than
      ;;  one line, it needs to be wrapped in a (progn )
      (progn
	;; look for a bse.cpp
	(setq nfn (concat bse ".cpp"))
	;; likewise
	(find-file nfn)
	)
      )
    )
   ;; second condition - the extension is "c" or "cpp"
   ((or (equal ext "cpp") (equal ext "c"))
    ;; look for a corresponding bse.h
    (setq nfn (concat bse ".h"))
    (find-file nfn)
    )
   )
  )
(global-set-key (kbd "C-c s") 'dts-switch-between-header-and-source)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))

(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")
(require 'moe-theme)

(add-hook 'before-save-hook 'white-space-cleanup)
(add-hook 'c++-mode-hook
	  '(lambda ()

	     ;; Use stroustrup style
	     (c-set-style "stroustrup")

	     ;; Setting indentation lvel
	     (setq c-basic-offset 4)

	     ;; Make TAB equivilent to 4 spaces
	     (setq tab-width 4)

	     ;; Use spaces to indent instead of tabs.
	     (setq indent-tabs-mode nil)

	     ;; Indent the continuation by 2
	     (setq c-continued-statement-offset 2)

	     ;; Brackets should be at same indentation level as the statements they open
	     ;; for example:
	     ;;                 if (0)        becomes        if (0)
	     ;;                     {                        {
	     ;;                        ;                         ;
	     ;;                     }                        }
	     (c-set-offset 'substatement-open 0)

	     ;; make open-braces after a case
	     (c-set-offset 'case-label '+)
	     ))
(load-theme 'moe-dark t)
