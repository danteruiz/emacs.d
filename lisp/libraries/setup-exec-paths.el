(when is-windows
  (setenv "PATH" (concat (getenv "PATH") "C:/cygwin/bin"))
  (setenv "PATH" (concat (getenv "PATH") "C:/cygwin/usr/local/bin"))
  (setenv "PATH" (concat (getenv "PATH") "C:/Program Files (x86)/MSBuild/12.0./Bin"))
  (setq exec-path (append exec-path '("C:/cygwin/bin")))
  (setq exec-path (append exec-path '("C:/Program Files (x86)/MSBuild/12.0./Bin")))
  (setq exec-path (append exec-path '("C:/cygwin/usr/local/bin"))))

(when is-linux
  (setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
  (setenv "PATH" (concat (getenv "PATH") ":/bin"))
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/texbin")))
  (setq exec-path (append exec-path '("/usr/bin")))
  (setq exec-path (append exec-path '("/usr/local/bin"))))
