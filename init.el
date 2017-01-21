(setq load-prefer-newer t)

;; We set `user-emacs-directory' here so we can use command-line
;; switch different emacs configuration like following:
;;
;;    emacs -q -l ~/coldnew-spacemacs/init.el
(defconst user-emacs-directory
  (file-name-directory (or load-file-name (buffer-file-name)))
  "My emacs config directory.")

(defconst user-cache-directory
  (file-name-as-directory (concat user-emacs-directory ".cache"))
  "My emacs storage area for persistent files.")
;; create the `user-cache-directory' if not exists
(make-directory user-cache-directory t)


(defconst user-ramdisk-directory
    (let ((ramdisk "/Volumes/ramdisk/")
          (user-ramdisk                   ; ~/ramdisk/
           (concat (getenv "HOME") "/ramdisk/"))
          (tmp "/tmp/"))
      (if (eq system-type 'darwin)
          ramdisk
        ;; if ~/ramdisk/ exist, use it
        (if (file-exists-p user-ramdisk)
            user-ramdisk
          ;; fallcack to system default ramdisk dir
          temporary-file-directory)))
  "My ramdisk path in system.")

(defun my/load-secret ()
  "Load my secret setting include password... etc."
  (let ((secret "~/.secret.el.gpg"))
    (when (file-exists-p secret) (load-file secret))))

;; This must come before configurations of installed packages.
;; Don't delete this line. If you don't want it, just comment it out by adding a
;; semicolon to the start of the line. You may delete these explanatory
;; comments.
(package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(require 'use-package)                  ; Installed by Cask
;; Auto install non-installed packages.
;; (setq use-package-always-ensure t)

(require 'req-package)

(req-package-finish)

(require 'paradox)                  ; Installed by Cask


;; Add directories to emacs's `load-path' recursively.
;; if path does not exist, create directory.
(let* ((lisp-dir '("local-lisp/" "themes/")))
  (dolist (lisp-path lisp-dir)
    (when (not (file-exists-p lisp-path))
      (make-directory (concat user-emacs-directory lisp-path) t))
    (let* ((load-dir (concat user-emacs-directory lisp-path))
           (default-directory load-dir))
      (setq load-path
            (append
             (let ((load-path (copy-sequence load-path)))
               (append
                (copy-sequence (normal-top-level-add-to-load-path '(".")))
                (normal-top-level-add-subdirs-to-load-path)))
             load-path)))))

;;;; add some system site-lisp to my load-path

;; Mac OSX
  (let ((default-directory "/usr/local/share/emacs/site-lisp/"))
    (normal-top-level-add-subdirs-to-load-path))

;; Linux
(when (equal system-type 'gnu/linux)
  (let ((default-directory "/usr/share/emacs/site-lisp/"))
    (normal-top-level-add-subdirs-to-load-path)))

;; load the `load-modules.el' file which help me load external modulept
(let ((script (concat user-emacs-directory "modules/load-modules.el")))
  (when (file-exists-p script)
    (load script)))

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq-default custom-file (concat user-cache-directory "custom.el"))
;; load custom-file only when file exist
(when (file-exists-p custom-file)
  (load-file custom-file))

(setq auto-save-list-file-prefix
      (concat user-cache-directory "auto-save-list/.saves-"))

(setq auto-save-interval 100)
(setq auto-save-timeout  60)
(setq auto-save-visited-file-name nil)
(setq delete-auto-save-files t)

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


(use-package iedit
  :bind (("C-;" . iedit-mode)))


(global-hungry-delete-mode)


(add-to-list 'magic-mode-alist
             `(,(lambda ()
                  (and (string= (file-name-extension (or (buffer-file-name) "")) "h")
                       (or (re-search-forward "#include <\\w+>"
                                              magic-mode-regexp-match-limit t)
                           (re-search-forward "\\W\\(class\\|template\\namespace\\)\\W"
                                              magic-mode-regexp-match-limit t)
                           (re-search-forward "std::"
                                              magic-mode-regexp-match-limit t))))
               . c++-mode))



(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (setq c-eldoc-includes "`pkg-config --cflags --libs` -I./ -I../")
	     (c-turn-on-eldoc-mode)))




(projectile-global-mode)

(setq projectile-known-projects-file
      (concat user-cache-directory "projectile-bookmarks.eld"))
(setq projectile-cache-file
      (concat user-cache-directory "projectile.cache"))
;; Enable projectile globally


  ;; enable helm globally
(helm-mode 1)
;; Use fuzzy match in helm
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)

;; make projectile use helm as completion system
(setq projectile-completion-system 'helm)
;; start helm-projectile
(helm-projectile-on)



;; rtags setup
;; ensure that we use only rtags checking
;; https://github.com/Andersbakken/rtags#optional-1
(defun setup-flycheck-rtags ()
  (interactive)
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))

;; only run this if rtags is installed
(when (require 'rtags nil :noerror)
  ;; make sure you have company-mode installed
  (require 'company)
  (define-key c-mode-base-map (kbd "M-.")
    (function rtags-find-symbol-at-point))
  (define-key c-mode-base-map (kbd "M-,")
    (function rtags-find-references-at-point))
  ;; disable prelude's use of C-c r, as this is the rtags keyboard prefix
  ;;(define-key prelude-mode-map (kbd "C-c r") nil)
  ;; install standard rtags keybindings. Do M-. on the symbol below to
  ;; jump to definition and see the keybindings.
  (rtags-enable-standard-keybindings)
  ;; comment this out if you don't have or don't use helm
  (setq rtags-use-helm t)
  ;; company completion setup
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (global-company-mode)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
  ;; use rtags flycheck mode -- clang warnings shown inline
  (require 'flycheck-rtags)
  ;; c-mode-common-hook is also called by c++-mode
  (add-hook 'c-mode-common-hook #'setup-flycheck-rtags))

(req-package glsl-mode
  :mode (("\\.vs\\'" . glsl-mode)
         ("\\.fs\\'" . glsl-mode)
         ("\\.gs\\'" . glsl-mode))
  :config
  (setq glsl-other-file-alist '(("\\.fs$" (".vs")) ("\\.vs$" (".fs")))))

(req-package js-mode
  :mode "\\.js\\'")

(req-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(req-package cwarn
  :config
  (add-hook 'c-mode-common-hook '(lambda () (cwarn-mode 1))))

(defun my/cc-mode/highlight-if-0 ()
  "highlight c/c++ #if 0 #endif macros"
  (setq cpp-known-face 'default)
  (setq cpp-unknown-face 'default)
  (setq cpp-known-writable 't)
  (setq cpp-unknown-writable 't)
  (setq cpp-edit-list '(("0" '(foreground-color . "gray")  default both)
                        ("1" default font-lock-comment-face both)))
  (cpp-highlight-buffer t))

;; Add to c/c++ mode
(defun my/cc-mode/highlight-if-0-hook ()
  (when (or (eq major-mode 'c++-mode) (eq major-mode 'c-mode))
    (my/cc-mode/highlight-if-0)))
(add-hook 'after-save-hook #'my/cc-mode/highlight-if-0-hook)

(dolist (m '(c-mode c++-mode))
  (font-lock-add-keywords
   m
   '(("\\<\\(int8_t\\|int16_t\\|int32_t\\|int64_t\\|uint8_t\\|uint16_t\\|uint32_t\\|uint64_t\\)\\>" . font-lock-keyword-face))))

(add-hook 'c-mode-common-hook 'electric-pair-mode)
(add-hook 'js-mode-hook 'electric-pair-mode)

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

             ;; Not indent code inside a namespace
             ;; for example:
             ;;                namespace A {
             ;;
             ;;                int namespace_global_variable;
             ;;
             ;;                class Class {
             ;;
             ;;                Class();
             ;;                //...
             ;;                };
             ;;
             ;;                }
             ;;(c-set-offset 'innamespace 0)
             ))

(load-theme 'reykjavik)
