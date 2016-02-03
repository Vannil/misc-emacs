;;; sudo-commands.el --- Execute commands as superuser with TRAMP

;;; Commentary:
;; At one point, everyone tries to do some superuser stuff through
;; Emacs, be it system management, or just editing a file in /etc.
;; These functions are wrappers around TRAMP that offer the most
;; basic commands.

;;; Code:
(defun sudo-shell-command (command)
  "Execute a shell command as root."
  (interactive
      (list (read-shell-command "Shell Command: ")))
  (with-temp-buffer
    (let ((dir default-directory))
      (cd (concat "/sudo::" dir))
      (shell-command command))))

(defun sudo-async-shell-command (command)
  "Execute a shell command as root asynchronously."
  (interactive
   (list (read-shell-command "Async Shell Command: ")))
  (with-temp-buffer
    (let ((dir default-directory))
      (cd (concat "/sudo::" dir))
      (async-shell-command command))))

(defun sudo-find-file (filename)
  "Visit a file as root."
  (interactive
   (list (read-file-name "Find file: " nil default-directory 'confirm)))
  (find-file (concat "/sudo::" filename) t))

(provide 'sudo-commands)

;;; sudo-commands.el ends here
