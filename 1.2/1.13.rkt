#lang racket

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;; g(n) = phi ^ n / sqrt(5)
;; h(n) = psi ^ n / sqrt(5)
;; phi = (1 + sqrt(5)) / 2
;; psi = (1 - sqrt(5)) / 2

;; Part 1
;;
;; Base cases:
;;   fib(0) = 0
;;   g(0) - h(0) = (1 - 1) / sqrt(5) = 0
;;
;;   fib(1) = 1
;;   g(1) - h(1) = ((1 + sqrt(5)) - (1 - sqrt(5)) / (2 * sqrt(5))
;;   g(1) - h(1) = 2 * sqrt(5) / 2 * sqrt(5) = 1
;;
;; Assume that fib(n) = g(n) - h(n). Base cases above.
;;   fib(n + 1) = g(n + 1) - h(n + 1)
;;   fib(n) + fib(n - 1) = g(n) * phi - h(n) * psi
;;   g(n) - h(n) + g(n) / phi - h(n) / psi = g(n) * phi - h(n) * psi
;;   g(n) * (1 - phi + 1 / phi) - h(n) * (1 - psi + 1 / psi) = 0
;;   g(n) * 0 - h(n) * 0 = 0
;;   0 = 0
;; Therefore, by induction, fib(n) = g(n) - h(n) for all n >= 0. QED.

;; Part 2
;;
;; By the previous proof, fib(n) = g(n) - h(n). Therefore to prove abs(fib(n) - g(n)) < 0.5...
;;   abs(fib(n) - g(n)) < 0.5
;;   abs(g(n) - h(n) - g(n)) < 0.5
;;   abs(-h(n)) < 0.5
;;   abs(((1 - sqrt(5)) / 2) ^ n / sqrt(5)) < 0.5
;;   abs((0.5 - sqrt(5) / 2) ^ n  / sqrt(5)) < 0.5
;;
;; From the above, let a = (0.5 - sqrt(5) / 2). As a < 1, a^n / sqrt(5) is a complex valued function
;; with real component converging to 0 and maximized for non-negative integers at n = 0. As a result,
;; it suffices to verify that our condition holds at n = 0.
;;   abs(a^0 / sqrt(5)) < 0.5
;;   ~0.2764 < 0.5
;; Therefore, fib(n) is the closest integer to g(n) for all n >= 0. QED.
