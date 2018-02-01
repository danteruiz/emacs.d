(cond
 ((string-equal system-type "windows-nt")
  (progn
    (setq is-windows t)
    (setq is-linux nil)))
 ((string-equal system-type "gnu/linux")
  (progn
    (setq is-linux t)
    (setq is-windows nil))))
