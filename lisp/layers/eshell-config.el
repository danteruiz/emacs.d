;; my eshell config
(require 'eshell)
(require 'em-smart)
(require 'dash)
(require 's)
(require 'all-the-icons)
(require 'macros)
(require 'magit)


(defun esh-acc (acc x)
  "Accumulator for evaluating and concatenating esh-sections."
  (--if-let (funcall x)
      (if (s-blank? acc)
          it
        (concat acc esh-sep it))
    acc))

(defun esh-prompt-func ()
  "Build `eshell-prompt-function'"
  (concat esh-header
          (-reduce-from 'esh-acc "" eshell-funcs)
          "\n"
          eshell-prompt-string))


(setq esh-sep  (propertize " | " 'face '(:foreground "white")))

(setq esh-section-delim " ")

(setq esh-header (propertize "\n┌─ " 'face '(:foreground "white")))

(setq eshell-prompt-regexp (propertize "└─> " 'face '(:foreground "white")))
(setq eshell-prompt-string (propertize "└─> " 'face '(:foreground "white")))

(esh-section esh-dir
             "\xf016"
             (abbreviate-file-name (eshell/pwd))
             '(:foreground "gold"))

(esh-section esh-git
             "\xf00a"
             (magit-get-current-branch)
             '(:foreground "#00FFFF"))

(esh-section esh-clock
             "\xe192"
             (format-time-string "%H:%M" (current-time))
             '(:foreground "forest green"))


(setq eshell-funcs (list esh-dir esh-git esh-clock))


(setq eshell-prompt-function 'esh-prompt-func)


(defun eshell/check ()
  )

(use-package eshell
  :defer t
  :config
  (progn
    (setq eshell-where-to-jump 'begin)
    (setq eshell-review-quick-commands nil)
    (setq eshell-smart-space-goes-to-end t)
    (defun eshell/clear ()
      (eshell/clear-scrollback))
    (message "Configuring"))

  :init
  (progn
    (message "intiial eshell")))
