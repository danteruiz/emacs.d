;;
;; keybindings
;;

(define-prefix-command 'leader-prefix-map)
(global-set-key (kbd "M-m") 'leader-prefix-map)

(defun bind-prefix-keys(map &rest bindings)
  (setq key (pop bindings) command (pop bindings))

  (while key
    (message "Key: %S Command: %S" key command)
    (define-key map (kbd key) command)
    (setq key (pop bindings) command (pop bindings))))

(provide 'keybindings)
