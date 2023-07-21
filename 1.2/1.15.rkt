#lang racket

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)

;; a.) procedure p is applied 5 times
;; b.) Theta(log(a)) since each time the angle is divided by 3.