#lang racket
(require rackunit)

#| TASK: |#
#| Define a procedure that takes three numbers as arguments |#
#| and returns the sum of the squares of the two larger numbers. |#

#| SOLUTION: |#
(define (sumOfSquares a b) (+ (* a a) (* b b)))

(define (solution a b c)
  (cond
        ((and (> a c) (> b c)) (sumOfSquares a b))
        ((and (> a b) (> c b)) (sumOfSquares a c))
  (else (sumOfSquares b c))))


#| TESTS: |#
(check-equal? (solution 1 2 3) (sumOfSquares 2 3) "test1")
(check-equal? (solution 1 2 -3) (sumOfSquares 1 2) "test2")
(check-equal? (solution -1 2 2) (sumOfSquares 2 2) "test3")
(check-equal? (solution 1 2 2) (sumOfSquares 2 2) "test4")
