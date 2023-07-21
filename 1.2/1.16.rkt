#lang racket

(define (fast-expt b n)
  (define (iter c i acc)
    (cond ((= i 0) acc)
          ((even? i) (iter (* c c) (/ i 2) acc))
          (else (iter c (- i 1) (* c acc)))))
  (iter b n 1))

(fast-expt 2 5)