(load-file (concat (file-name-directory load-file-name)
                     "lisp/core/load-paths.el"))
(require 'utils)
(require 'configure)
(require 'keybindings)
;;(profile-startup)
(configure/initialize)
(put 'upcase-region 'disabled nil)

