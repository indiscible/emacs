(defun connect-to-q ()
  "create q subproces"
  (interactive)
  (start-process "q" "qbuffer" "c:/gilles/q/w32/q.exe")
  (process-send-string "q" "h: hopen 5000\n")
)
(defun remove-quotes (in)
  (replace-regexp-in-string "\"" "\\\"" in t t))
(defun remove-backslash (in)
  (replace-regexp-in-string "\\\\" "\x5c\x5c" in t t))

(defun send-to-q ()
  "send line to q"
  (interactive)
  (let ((line (remove-quotes
			   (remove-backslash (buffer-substring-no-properties 
							   (line-beginning-position) (point))))))
	(message "%s" line)
	(unless (get-buffer-process "qbuffer") (connect-to-q) )
	(process-send-string "q" 
						 ( format "h \"%s\"\n" line ))))

