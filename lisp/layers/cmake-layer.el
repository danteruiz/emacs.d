(defvar cmake-packages
  '(
    cmake-mode))

(install-packages cmake-packages)

(defun cmake-hook()
  (eval-after-load 'company
  '(add-to-list 'company-backends 'company-cmake))
  (company-mode))
(use-package cmake-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
    (add-to-list 'auto-mode-alist '("/CMakeLists\\.cmake\\'" . cmake-mode))
    (add-hook 'cmake-mode-hook 'cmake-hook)))
