;;; misc-simple.el --- Simple miscellaneous functions

;;; Commentary:
;; These functions are simple and not really
;; worth a category on their own, in my opinion, so
;; they are presented together.

;;; Code:
(defun eval-find-file (file)
  "Evaluate FILE."
  (interactive
   (list (read-file-name "Find file: " nil default-directory 'confirm)))
  (with-temp-buffer
    (insert-file-contents file)
    (eval-buffer)))

(defun close-buffer-and-window ()
  "Kill the current buffer and delete the current window."
  (interactive)
  (kill-buffer)
  (delete-window))

(provide 'misc-simple)

;;; misc-simple.el ends here
