(defun fac (n)
  (if (zerop n)
      1
      (* n (fac (1- n)))))

(defun addparts (input)
    (reduce #'+  (map 'list #'digit-char-p (princ-to-string input))))
