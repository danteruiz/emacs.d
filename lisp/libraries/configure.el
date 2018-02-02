;;
;; configure emacs file
;;
(require 'utils)

(defun configure/initialize ()
  (configure/remove-ui-elements)
  (configure/mouse-style)

  ;; extra things
  (defalias 'yes-or-no-p 'y-or-n-p)
  )

(defun configure/remove-ui-elements ()
  (when (featurep 'menu-bar) (menu-bar-mode -1))
  (when (featurep 'tool-bar) (tool-bar-mode -1))
  (when (featurep 'scroll-bar) (scroll-bar-mode -1))
  )

(defun configure/mouse-style ()
  (blink-cursor-mode t)
  )

(provide 'configure)
