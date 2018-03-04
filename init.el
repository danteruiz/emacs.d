
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq load-prefer-newer t)
(setq elpa-https nil)
(setq emacs-insecure t)
(load-file (concat (file-name-directory load-file-name) "my-layers.el"))
(load-file (concat (file-name-directory load-file-name)
                   "lisp/libraries/load-paths.el"))
(require 'utils)
(require 'configure)
(configure/initialize)
(configure/archive-packages)
(configure/load-layers my-layers)
(when (system-is-windows)
  (setq default-directory "C:Users/Dante/")
  (load-file "~/.emacs.d/themes/solarized-definitions.el"))
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(load-theme 'solarized t)
