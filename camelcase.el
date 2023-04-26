(defun upper-camelcase-region (beg end)
  "Convert region to upper camelCase."
  (interactive "r")
  (let ((str (buffer-substring-no-properties beg end)))
    (delete-region beg end)
    (insert (mapconcat 'capitalize (split-string str) ""))))

(defun lower-camelcase-region (beg end)
  "Convert region to lower camelCase."
  (interactive "r")
  (let* ((str (buffer-substring-no-properties beg end))
         (words (split-string str))
         (first-word (car words))
         (rest-words (cdr words)))
    (delete-region beg end)
    (insert (concat (downcase first-word)
                    (mapconcat 'capitalize rest-words "")))))


;; (defun camelcase-or-lower-camelcase-region (beg end &optional first-word-lowercase)
;;   "Convert the region from BEG to END from whitespace separated words
;; to camelcase or lower camelcase depending on whether a universal
;; argument is given. If FIRST-WORD-LOWERCASE is non-nil, the first word
;; will also be lowercase."
;;   (interactive "rP")
;;   (if (or (not current-prefix-arg) (equal current-prefix-arg '(4)))
;;       (lower-camelcase-region beg end)
;;     (camelcase-region beg end)))



