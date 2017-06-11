(setq explicit-shell-file-name "C:/cygwin/bin/bash")
(setq shell-file-name "cmder")
(setenv "SHELL" shell-file-name)

(global-set-key [f1] 'shell)
(add-hook 'comint-output-filter-functions 'comint-strip-crtl-m)

(defun cmder-shell()
  "Run cmder bash in shell mode."
  (interactive)
  (let ((explicit-shell-file-name "C:cmder/Cmder"))
    (call-interactively 'shell)))
