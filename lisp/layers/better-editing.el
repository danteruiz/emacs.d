(defun header-and-source-switch ()
  "Switch between a c/c++ header (.h) and its corresponding source (.c/.cpp)."
  (interactive)
  ;; grab the base of the current buffer's file name
  (setq bse (file-name-sans-extension buffer-file-name))
  ;; and the extension, converted to lowercase so we can
  ;; compare it to "h", "c", "cpp", etc
  (setq ext (downcase (file-name-extension buffer-file-name)))
  ;; This is like a c/c++ switch statement, except that the
  ;; conditions can be any true/false evaluated statement
  (cond
   ;; first condition - the extension is "h"
   ((equal ext "h")
    ;; first, look for bse.c
    (setq nfn (concat bse ".c"))
    (if (file-exists-p nfn)
	;; if it exists, either switch to an already-open
	;;  buffer containing that file, or open it in a new buffer
	(find-file nfn)
      ;; this is the "else" part - note that if it is more than
      ;;  one line, it needs to be wrapped in a (progn )
      (progn
	;; look for a bse.cpp
	(setq nfn (concat bse ".cpp"))
	;; likewise
	(find-file nfn))))
   ;; second condition - the extension is "c" or "cpp"
   ((or (equal ext "cpp") (equal ext "c"))
    ;; look for a corresponding bse.h
    (setq nfn (concat bse ".h"))
    (find-file nfn))))

(global-set-key (kbd "C-c s") 'header-and-source-switch)
