(setq load-prefer-newer t)
(setq default-directory "c:users/dante/")
(load-file (concat (file-name-directory load-file-name)
                   "lisp/libraries/load-paths.el"))
(require 'configure)
(configure/initialize)

(require 'package)
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
(require 'utils)

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
