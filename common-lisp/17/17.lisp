;; If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

;; If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

;; NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

(defun simple-to-words (number)
  (format nil "~r" number))

(defun complex-to-words (number)
  (if (and (> number 100)
           (not (= 0 (mod number 100))))
      (concatenate 'string "and" (simple-to-words number))
      (simple-to-words number)
      ))

(defun strip-hyphens (word)
  (remove #\- word))

(defun strip-spaces (word)
  (remove #\space word))

(defun count-valid-letters (word)
  (length (strip-spaces
           (strip-hyphens word))))

(defun count-valid-letters-of-number (number)
  (count-valid-letters (complex-to-words number)))

(defun count-valid-up-to (number)
  (let* ((nums (loop for n from 1 below (+ 1 number) by 1
                     collect (count-valid-letters-of-number n)))
         (total (reduce #'+ nums)))
    total
    ))

(count-valid-up-to 1000)
