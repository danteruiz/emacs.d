(cond
 ((string-equal system-type "windows-nt")
  (progn
    (setq is-windows t)))
 ((string-equal system-type "gnu/linux")
  (progn
    (setq is-linux t))))
