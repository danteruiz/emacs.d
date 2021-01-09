(load-file (concat (file-name-directory load-file-name)
                     "lisp/core/load-paths.el"))

(require 'configure)
(configure/emacs-defaults)
(configure/major-modes)
(put 'upcase-region 'disabled nil)
