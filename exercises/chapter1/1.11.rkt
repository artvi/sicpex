#lang racket
(require rackunit)

#|TASK:
A function f is defined by the rule that
f(n) = n if n < 3 and f(n) = f(n − 1) + f(n − 2) + f(n − 3) if n ≥ 3 
Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.
|#

#|SOLUTION:|#

(define (recursive n)
  (if (< n 3)
      n
      (+
       (recursive (- n 1))
       (recursive (- n 2))
       (recursive (- n 3)))))


(define (iterative n)
  (define (f-iter counter a b c)
    (if (>= counter n)
        a
        (f-iter (+ counter 1) (+ a b c) a b)))

  (if (< n 3)
      n
      (f-iter 3 3 2 1)))


#|TESTS:|#
(check-equal? (iterative 3) 3 "iterative for 3")
(check-equal? (iterative 4) 6 "iterative for 4")
(check-equal? (iterative 5) 11 "iterative for 5")
(check-equal? (iterative 6) 20 "iterative for 6")
(check-equal? (iterative 7) 37 "iterative for 7")

(check-equal? (recursive 3) 3 "recursive for 3")
(check-equal? (recursive 4) 6 "recursive for 4")
(check-equal? (recursive 5) 11 "recursive for 5")
(check-equal? (recursive 6) 20 "recursive for 6")
(check-equal? (recursive 7) 37 "recursive for 7")
