;;; page-narrow-move.el --- Page movement in a narrowed buffer

;;; Commentary:
;; When a buffer is narrowed using `narrow-to-page', the normal
;; page movement commands (`forward-page' and `backward-page')
;; do not work.  These functions solve the problem.

;;; Code:
(defun narrow-move-by-page (&optional arg)
  "If the current buffer is narrowed by page, it moves to the ARG page."
  (let ((dir (or arg 1)))
    (when (buffer-narrowed-p)
      (widen)
      (narrow-to-page dir)
      (goto-char (point-min)))))

(defun narrow-move-forward-by-page (&optional arg)
  "If the current buffer is narrowed by page, it moves ARG pages forward."
  (interactive "P")
  (let ((dir (or arg 1)))
    (narrow-move-by-page dir)))

(defun narrow-move-backward-by-page (&optional arg)
  "If the current buffer is narrowed by page, it moves ARG pages bacward."
  (interactive "P")
  (let ((dir (or arg 1)))
    (narrow-move-by-page (- dir))))

(provide 'page-narrow-move)
