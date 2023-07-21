#lang racket

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (mult a b)
  (define (iter i j acc)
    (cond ((= j 0) acc)
          ((even? j) (iter (double i) (halve j) acc))
          (else (iter i (- j 1) (+ i acc)))))
  (iter a b 0))

(mult 2 5)
(mult 5 2)