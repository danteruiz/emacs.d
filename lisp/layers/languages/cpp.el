;; cpp and cmake configuration 
(require 'common)
;; cmake configuration
(defun cmake-hook()
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-cmake))
  (company-mode))

(use-package cmake-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
    (add-to-list 'auto-mode-alist '("/CMakeLists\\.cmake\\'" . cmake-mode))
    (add-hook 'cmake-mode-hook 'cmake-hook)))



(better-editing/add-to-header-list '("h"))
(better-editing/add-to-source-list '("cpp" "c" "mm" "m"))
(setq auto-mode-alist
      (append '(("\\.h\\'" . c++-mode)
		("\\.cpp\\'" . c++-mode)
		("\\.hpp\\'" . c++-mode)
		("\\.mm\\'" . objc-mode)
		("\\.m\\'" . objc-mode))
	      auto-mode-alist))

(add-hook 'c++-mode-hook
	  '(lambda ()
	     (setq comment-start "/*")
	     (setq comment-end "*/")
	     (setq c-basic-offset 4)
	     (setq tab-width 4)
	     (setq indent-tabs-mode nil)
	     (setq c-continued-statemant-offset 2)
	     (c-set-offset 'substatement-open 0)
	     (c-set-offset 'inlambda 0)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'brace-list-intro '+)
	     (c-set-offset 'brace-list-open 0)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'case-label '+)))

(add-hook 'objc-mode-hook
	  '(lambda ()
	     (setq c-basic-offset 4)
	     (setq tab-width 4)
	     (setq indent-tabs-mode nil)
	     (setq c-continued-statemant-offset 2)
	     (c-set-offset 'substatement-open 0)
	     (c-set-offset 'inlambda 0)
	     (c-set-offset 'brace-list-open 0)
	     (c-set-offset 'case-label '+)))



;; (defun configure-cpp-ide ()
;;   (require 'rtags)
;;   (require 'company-rtags)
;; 
;;   (use-package irony-eldoc
;;     :ensure t)
;; 
;;   (use-package irony
;;     :ensure t)
;; 
;;   (use-package flycheck-irony
;;     :ensure t)
;; 
;;   (use-package company
;;     :ensure t)
;; 
;;   (use-package auto-complete-clang
;;     :ensure t)
;; 
;;   (use-package flycheck-rtags
;;     :ensure t)
;; 
;;   (use-package rtags
;;     :ensure t
;;     :hook (c++-mode . rtags-start-process-unless-running)
;;     :config
;;     (progn
;;       (setq rtags-completions-enabled t
;; 	    rtags-rc-binary-name "/home/dante/packages/rtags/build/bin/rc"
;; 	    rtags-use-helm nil
;; 	    rtags-rdm-binary-name
;; 	    "/home/dante/packages/rtags/build/bin/rdm")
;;       (bind-prefix-keys 'leader-prefix-map "rr" 'rtags-find-references-at-point)
;;       (bind-prefix-keys 'leader-prefix-map "re" 'rtags-find-symbol)
;;       (bind-prefix-keys 'leader-prefix-map "rv" 'rtags-find-virtuals-at-point)
;;       (bind-prefix-keys 'leader-prefix-map "rn" 'rtags-next-match)
;;       (bind-prefix-keys 'leader-prefix-map "rp" 'rtags-previous-match)
;;       (bind-prefix-keys 'leader-prefix-map "rP" 'rtags-preprocess-file)
;;       (bind-prefix-keys 'leader-prefix-map "rf" 'rtags-location-stack-forward)
;;       (bind-prefix-keys 'leader-prefix-map "rb" 'rtags-location-stack-back)
;;       (bind-prefix-keys 'leader-prefix-map "rd" 'rtags-find-symbol-at-point)
;;       (bind-prefix-keys 'leader-prefix-map "ra" 'rtags-find-references)))

  ;; (use-package cmake-ide
  ;;   :ensure t
  ;;   :config
  ;;   (progn
  ;;     (cmake-ide-setup)
  ;;     (setq rtags-autostart-diagnostics t)
  ;;     (rtags-diagnostics)
  ;;     (bind-prefix-keys 'leader-prefix-map "ca" 'cmake-ide-compile)))
  ;; 
  ;; (cmake-ide-setup))


;; (if enable-cpp-ide
;;     (configure-cpp-ide))
