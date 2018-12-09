;;; rubocop-fix-file --- Execute rubocop --auto-correct on Emacs silently

;; Copyright (C) 2018- blue0513

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

;; Author: blue0513
;; URL: https://github.com/blue0513
;; Version: 0.0.2

;;; Commentary:

;; Load this script and Execute command on *.rb file
;;
;;   (require 'rubocop-fix-file)
;;
;;   `M-x rubocop-fix-file`

;;; Code:

(define-minor-mode rubocop-fix-file-mode
  "Enable format-on-save by applying rubocop-fix-file."
  :lighter " rubocop-fix-file"
  (if rubocop-fix-file-mode
      (add-hook 'before-save-hook 'rubocop-fix-file)
    (remove-hook 'before-save-hook 'rubocop-fix-file)))

(defun rubocop-fix-file ()
  "Execute rubocop auto correct."
  (interactive)
  (let* ((filepath buffer-file-name)
	 (current-filename (file-name-nondirectory filepath)))
    (call-process-shell-command
     (concat "rubocop -a --format emacs " current-filename) nil 0)
    (message "rubocop fixing current file....")))

;; * provide

(provide 'rubocop-fix-file)

;;; rubocop-fix-file.el ends here
