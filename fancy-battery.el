;;; fancy-battery.el --- Fancy battery display       -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Sebastian Wiesner <swiesner@lunaryorn.com>

;; Author: Sebastian Wiesner <swiesner@lunaryorn.com>
;; Keywords: convenience tools hardware
;; Package-Version: 0.1
;; Package-Requires: ((emacs "24.1"))

;; This file is part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provide `fancy-battery-mode', which is like `display-battery-mode' but with
;; fancier display, and more customization options.

;;; Code:

(require 'battery)

(defcustom fancy-battery-mode-line
  '(:eval (fancy-battery-default-mode-line))
  "Mode line string for `fancy-battery-mode'."
  :type 'sexp
  :group 'battery
  :risky t)

(defface fancy-battery-critical '((t :inherit error))
  "Face for critical battery status"
  :group 'battery)

(defface fancy-battery-charging '((t :inherit success))
  "Face for charging battery status."
  :group 'battery)

(defface fancy-battery-discharging '((t :inherit warning))
  "Face for charging battery status."
  :group 'battery)

(defun fancy-battery-default-mode-line ()
  "Assemble a mode line string for Fancy Battery Mode.

Display the remaining battery time, if available, otherwise the
percentage.  If the battery is critical, use
`battery-critical-face'.  Otherwise use `fancy-battery-charging'
or `fancy-battery-discharging', depending on the current state."
  (when battery-status-function
    (let* ((status (funcall battery-status-function))
           (time (cdr (assq ?t status)))
           (face (pcase (cdr (assq ?b status))
                   ("!" 'fancy-battery-critical)
                   ((or "" "+") 'fancy-battery-charging)
                   (_ 'fancy-battery-discharging))))
      (if time
          (propertize (if (string= time "N/A")
                          (concat (cdr (assq ?p status)) "%%") time)
                      'face face)
        ;; Battery status is not available
        (propertize "N/A" 'face 'error)))))

(defvar fancy-battery-timer nil
  "Timer to update the battery information.")

;;;###autoload
(define-minor-mode fancy-battery-mode
  "Display battery status in the mode line.

Like `display-battery-mode', but fancier, and with more
customization options.

With prefix argument ARG, enable Fancy Battery Mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil.

If `battery-status-function' is nil, the mode is not enabled.

The text in the mode line is controlled by
`fancy-battery-mode-line'.  Battery information is obtained from
`battery-status-function', and updated every
`battery-update-interval' seconds."
  :global t :group 'battery
  (when fancy-battery-timer
    (cancel-timer fancy-battery-timer))
  (unless global-mode-string
    (setq global-mode-string '("")))

  (cond
   ((not fancy-battery-mode)
    (setq global-mode-string (delq 'fancy-battery-mode-line
                                   global-mode-string)))
   ((not battery-status-function)
    (fancy-battery-mode -1))
   (t
    (add-to-list 'global-mode-string 'fancy-battery-mode-line t)
    (setq fancy-battery-timer (run-at-time nil battery-update-interval
                                           #'force-mode-line-update)))))

(provide 'fancy-battery)

;;; fancy-battery.el ends here
