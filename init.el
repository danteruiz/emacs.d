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
(setq package-list '(async auctex auto-complete autopair cmake-ide
                           cmake-mode company company-irony
			   counsel flyspell-correct-ivy
			   counsel-projectile ivy
			   projectile
                           company-irony-c-headers dash epl flycheck
                           flycheck-irony flycheck-pyflakes 
                           helm helm-core helm-ctest
                           helm-flycheck helm-flyspell helm-ls-git helm-ls-hg
                           hungry-delete irony
                           let-alist levenshtein magit markdown-mode pkg-info
                           popup rtags seq solarized-theme vlf web-mode
                           window-numbering writegood-mode yasnippet doom-themes))
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

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




(load-theme 'doom-one  t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (chicken-scheme yasnippet writegood-mode window-numbering web-mode vlf solarized-theme rtags markdown-mode magit hungry-delete helm-ls-hg helm-ls-git helm-flyspell helm-flycheck helm-ctest helm flycheck-pyflakes flycheck-irony flycheck dash company-irony-c-headers counsel-projectile flyspell-correct-ivy counsel company-irony company cmake-mode cmake-ide autopair auto-complete auctex async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
