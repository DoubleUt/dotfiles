;; markdown-mode
(setq markdown-command "multimarkdown")
(defun eww-open-file-other-window (file)
  (if (one-window-p) (split-window))
  (other-window 1)
  (eww-open-file file))

(defun markdown-preview-eww ()
  (interactive)
  (message (buffer-file-name))
  (call-process "marked" nil nil nil "--gfm" "-o" "/tmp/marked.html" (buffer-file-name))
  (eww-open-file-other-window  "/tmp/marked.html"))
