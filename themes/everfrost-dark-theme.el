;;; nord-theme.el --- An arctic, north-bluish clean and elegant theme

;; Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com> (https://www.arcticicestudio.com)
;; Copyright (C) 2016-present Sven Greb <development@svengreb.de> (https://www.svengreb.de)

;; Title: Everfrost Theme
;; Project: everfrost-emacs
;; Version: 0.5.0
;; URL: https://github.com/arcticicestudio/everfrost-emacs
;; Author: Arctic Ice Studio <development@arcticicestudio.com>
;; Package-Requires: ((emacs "24"))
;; License: MIT

;;; Commentary:

;; Everfrost is a 16 colorspace theme build to run in GUI- and terminal
;; mode with support for many third-party syntax- and UI packages.

;;; References:
;; Awesome Emacs
;;   https://github.com/emacs-tw/awesome-emacs
;; GNU ELPA
;;   https://elpa.gnu.org
;; GNU Emacs
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Creating-Custom-Themes.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Faces.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Standard-Faces.html
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Face-Customization.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
;;   https://www.gnu.org/software/emacs/manual/html_node/elisp/Display-Feature-Testing.html
;; marmalade repo
;;   https://marmalade-repo.org
;; MELPA
;;   https://melpa.org
;;   https://stable.melpa.org

;;; Code:
(require 'everfrost-common)

(unless (>= emacs-major-version 24)
  (error "Everfrost theme requires Emacs 24 or later!"))

(deftheme everfrost-dark "An arctic, north-bluish clean and elegant theme")

(defgroup everforst-dark nil
  "Everfrost theme customizations.
  The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom everfrost-comment-brightness 10
  "Allows to define a custom comment color brightness with percentage adjustments from 0% - 20%.
  As of version 0.4.0, this variable is obsolete/deprecated and has no effect anymore and will be removed in version 1.0.0!
  The comment color brightness has been increased by 10% by default.
  Please see https://github.com/arcticicestudio/everfrost-emacs/issues/73 for more details."
  :type 'integer
  :group 'everfrost-dark)


(defcustom everfrost-region-highlight nil
  "Allows to set a region highlight style based on the Everfrost components.
  Valid styles are
    - 'snowstorm' - Uses 'everfrost0' as foreground- and 'everfrost4' as background color
    - 'frost' - Uses 'everfrost0' as foreground- and 'everfrost8' as background color"
  :type 'string
  :group 'everfrost-dark)

(defcustom everfrost-uniform-mode-lines nil
  "Enables uniform activate- and inactive mode lines using 'everfrost3' as background."
  :type 'boolean
  :group 'everfrost-dark)

(setq everfrost-theme--brightened-comments '("#4c566a" "#4e586d" "#505b70" "#525d73" "#556076" "#576279" "#59647c" "#5b677f" "#5d6982" "#5f6c85" "#616e88" "#63718b" "#66738e" "#687591" "#6a7894" "#6d7a96" "#6f7d98" "#72809a" "#75829c" "#78859e" "#7b88a1"))

(defun everfrost-theme--brightened-comment-color (percent)
  "Returns the brightened comment color for the given percent.
  The value must be greater or equal to 0 and less or equal to 20, otherwise the default 'everfrost3' color is used.
  As of version 0.4.0, this function is obsolete/deprecated and has no effect anymore and will be removed in version 1.0.0!
  The comment color brightness has been increased by 10% by default.
  Please see https://github.com/arcticicestudio/everfrost-emacs/issues/73 for more details."
  (nth 10 everfrost-theme--brightened-comments))

(make-obsolete
  'everfrost-theme--brightened-comment-color
  "The custom color brightness feature has been deprecated and will be removed in version 1.0.0!\
  The comment color brightness has been increased by 10% by default.\
  Please see https://github.com/arcticicestudio/everfrost-emacs/issues/73 for more details."
  "0.4.0")

(defun everfrost-display-truecolor-or-graphic-p ()
  "Returns whether the display can display everfrost colors"
  (or (= (display-color-cells) 16777216) (display-graphic-p)))


(create-everfrost-theme 'dark 'everfrost-dark)
(provide-theme 'everfrost-dark)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; everfrost-theme.el ends here
