(setq load-prefer-newer t)
(setq elpa-https nil)
(setq emacs-insecure t)
(load-file (concat (file-name-directory load-file-name)
                   "lisp/libraries/load-paths.el"))
(require 'utils)
(require 'configure)
(configure/initialize)
(configure/archive-packages)
(configure/load-layers)
(when (system-is-windows)
    (setq default-directory "C:Users/Dante/"))
(load-theme 'adwaita t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b099685963c251fb3ed5dd60237bda3390a11372221dfc9d168aa54e7b1c252e" default)))
 '(package-selected-packages (quote (qml-mode magit slack use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
