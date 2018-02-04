(setq load-prefer-newer t)
(setq elpa-https nil)
(setq emacs-insecure t)
(load-file (concat (file-name-directory load-file-name)
                   "lisp/libraries/load-paths.el"))
(require 'configure)
(configure/initialize)
(configure/archive-packages)
(configure/load-layers)

(load-theme 'adwaita t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit slack use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
