;;; w3m-delete-cookies.el --- Delete unwanted cookies

;;; Commentary:
;; By default, emacs-w3m accepts all cookies and stores them in a file,
;; as a list.  This function removes cookies you don't want to save.
;; It is a good idea to call it when a w3m buffer is closed
;; with the hook `w3m-delete-buffer-hook'.
;; This hook is not called when emacs-w3m is closed, though.
;; To call this function when quitting w3m you must advice the
;; `w3m-quit' function, like this:
;; (advice-add 'w3m-quit :after (lambda (a) (w3m-addon-delete-cookies)))

;;; Code:
(defun w3m-addon-delete-cookies ()
  "Delete the unwanted cookies.

This function uses the second field of the vector used to store a single
cookie in `w3m-cookie-file'.
To recognize if a cookie is unwanted, it uses the
variable `w3m-cookie-accept-domains'."
  (let (ck)
    (with-temp-buffer
      (insert-file-contents w3m-cookie-file)
      (let ((lst (read (current-buffer))))
	    (dolist (el lst)
	      (let ((dmn (aref el 1)))
		(when (member dmn w3m-cookie-accept-domains)
		  (push el ck))))))
    (with-temp-buffer
      (insert
       (concat ";;; .cookie  -*- mode: emacs-lisp; coding: iso-2022-7bit -*-\n"
	       ";; This file is generated automatically by emacs-w3m\n"
	       ";; but modified by an external function.\n"))
      (unless (null ck)
	(print ck (current-buffer)))
      (write-region nil nil w3m-cookie-file nil 0))))

(provide 'w3m-delete-cookies)

;;; w3m-delete-cookies ends here
