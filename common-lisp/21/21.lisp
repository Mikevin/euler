;(ql:quickload :iterate)

(use-package :iterate)

(defun divisorp (n divisor)
  (zerop (mod n divisor)))

(defun divisors (n)
  (iter (for i from 1 to (- n 1))
    (when (divisorp n i)(collect i))))

(defun sumdivisors(n)
  (reduce #'+ (divisors n)))

(defun amicablep (n)
  (let ((sumd (sumdivisors n)))
    (and (not (eq n sumd))(eq  n (sumdivisors sumd)))))

(defun sumamicablepairsupto (n)
  (let (
        (apairs (iter (for i from 1 to (- n 1))
                  (when (amicablep i)(collect i)))))
    (reduce #'+ apairs)))

(print (divisors 220))
(print (sumdivisors 220))
(print (amicablep 220))
(print (sumamicablepairsupto 10000))

