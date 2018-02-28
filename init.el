(setq load-prefer-newer t)
(setq elpa-https nil)
(setq emacs-insecure t)
(load-file (concat (file-name-directory load-file-name)
                   "lisp/libraries/load-paths.el"))
(require 'utils)
(require 'configure)
(configure/initialize)
(configure/archive-packages)
(configure/load-layers)
(when (system-is-windows)
    (setq default-directory "C:Users/Dante/"))
(load-theme 'solarized t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "5fcfc915b3247c9c40535faa2790cc752e434fbc4a63bba95b4f8c16589dce47" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "a932815fa978102d82c2363bd5a654d2c9cf750de2c4d5226e48393ba9e26209" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "d71e07994d2ea5c12ca5978f00f2e4937ecb968ef82045de23737d051577cff3" "3c03b55aeb17a451e5fd23747e418f98a80db9950de203c534ac177ec32c42cf" "86661f0f0bdf7525f308a704276097c2e6124fa8e534408b36ae4bd7cf32e4cb" "b90bf0447ec86d0d75644705b0a36657b807c29891cdfebd21dbf0b6bd204dce" "787a4b6fa234a3b85eb278f423f03c325372db6fcc41f0c537752549e0042812" "65769d198b926d94505bc22720253aba1b0902e78cd35d4d3f470b188c7530a8" "b099685963c251fb3ed5dd60237bda3390a11372221dfc9d168aa54e7b1c252e" default)))
 '(package-selected-packages (quote (qml-mode magit slack use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
