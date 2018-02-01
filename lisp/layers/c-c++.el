;;c-c++ configureation layers
(require 'utils)
(defvar c-c++-packages
      '(cc-mode))

(install-packages c-c++-packages)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

(add-hook 'c++-mode-hook
          '(lambda ()
             (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             (setq c-continued-statemant-offset 2)
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'case-label '+)))
