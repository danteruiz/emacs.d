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
	     '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  
(package-initialize)
;; list the packages you want
(defvar package-list)
(setq package-list '(doom-themes moe-theme qml-mode flymake blackboard-theme))
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'load-path "~/.emacs.d/libraries")
(add-to-list 'load-path "~/.emacs.d/themes/")

(load "system")
(load "setup-exec-paths")
(load "header-and-source-switch")
(load "reload-init.el")
(load "csharp-mode")

(require 'csharp-mode)

(defun ajt-eslint ()
  (interactive)
  (shell-command (concat "eslint -f unix " (buffer-file-name)) "*eslint-log*")
  (pop-to-buffer "*eslint-log*")
  (compilation-mode))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.qml\\'" . qml-mode))
(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(add-hook 'qml-mode-hook
          '(lambda ()
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             ))

(add-hook 'js-mode-hook
	  '(lambda ()
	     (setq tab-width 4)
	     (setq indent-tabs-mode nil)
	     ))

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
(load-theme 'darkokai t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "c50a672a129e71b9362b209c63d4e203ccc88a388c370411535b8b54ecc878bc" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "d71e07994d2ea5c12ca5978f00f2e4937ecb968ef82045de23737d051577cff3" "b90bf0447ec86d0d75644705b0a36657b807c29891cdfebd21dbf0b6bd204dce" "0e33022384e4db1374827f51e3d9e9a2d56282c2e3568c22f1c12ad80e20cf0c" "d79ece4768dfc4bab488475b85c2a8748dcdc3690e11a922f6be5e526a20b485" "1b1e54d9e0b607010937d697556cd5ea66ec9c01e555bb7acea776471da59055" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "47744f6c8133824bdd104acc4280dbed4b34b85faa05ac2600f716b0226fb3f6" "cd0d4fdf764f757fd659ee2697239a62f38d15203000ced1ad8e43c978942c68" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "6f11ad991da959fa8de046f7f8271b22d3a97ee7b6eca62c81d5a917790a45d9" "3c03b55aeb17a451e5fd23747e418f98a80db9950de203c534ac177ec32c42cf" "b81bfd85aed18e4341dbf4d461ed42d75ec78820a60ce86730fc17fc949389b2" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" default)))
 '(package-selected-packages
   (quote
    (multiple-cursors dark-krystal-theme darkmine-theme darcula-theme darkane-theme darktooth-theme dark-mint-theme darkokai-theme darkburn-theme railscasts-reloaded-theme zenburn-theme railscasts-theme soothe-theme cherry-blossom-theme lua-mode magit rainbow-mode qml-mode moe-theme doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
