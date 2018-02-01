(defvar hifi-project)
;;(setq hifi-project "msbuild /help")
(setq hifi-project "msbuild C:/Users/Dante/github/hifi/build/hifi.sln /t:build /p:Configuration=Release")

(defun build-solution ()
  (interactive)
  (with-output-to-temp-buffer "*output*"
    (start-process-shell-command "build-process" "*output*" hifi-project)))


(global-set-key [f5] 'build-solution)
