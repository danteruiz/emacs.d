;; hifi.el
(require 'utils)

(defun build-interface ()
  (when (system-is-windows))

  (when (system-is-linux))

  (when (system-is-mac)))

(defun cmake-hifi () )
(defun sync-resources () )
(defun sync-scripts () )
(defun cmake-qt-launcher ()
  (message "cmake qt launcher"))

(bind-keys* :prefix-map hifi-prefix-map
	    :prefix "M-m"
	    ("hcq" . cmake-qt-launcher))
