;; (setq debug-on-error t)
(load-file (concat (file-name-directory load-file-name)
                   "lisp/core/load-paths.el"))

(require 'configure)
(require 'subr-x)
(configure/load-user-config-file)
(configure/emacs-defaults)
(configure/load-layers my-layers)
