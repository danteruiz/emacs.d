(setq debug-on-error t)
(load-file (concat (file-name-directory load-file-name)
                   "lisp/core/load-paths.el"))

(require 'configure)
(configure/load-user-config-file)
(configure/emacs-defaults)
(configure/load-layers my-layers)

;; (configure/text-editing)
;; (configure/auto-complete)
;; (configure/syntax-checking)
;; (configure/major-modes)
;; (configure/projects)
