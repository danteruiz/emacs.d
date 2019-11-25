(defvar better-editing-packages
  '(move-text
    multiple-cursors))


(install-packages better-editing-packages)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(move-text-default-bindings)

(defun header-and-source-switch ()
  "Switch between a c/c++ header (.h) and its corresponding source (.c/.cpp)."
  (interactive)
  (setq bse (file-name-sans-extension buffer-file-name))
  (setq ext (downcase (file-name-extension buffer-file-name)))
  (cond
   ((equal ext "h")
    (setq nfn (concat bse ".c"))
    (if (file-exists-p nfn)
	(find-file nfn)
      (progn
	(setq nfn (concat bse ".cpp"))
	(find-file nfn))))
   ((or (equal ext "cpp") (equal ext "c"))
    (setq nfn (concat bse ".h"))
    (find-file nfn))))

(global-set-key (kbd "C-c s") 'header-and-source-switch)
