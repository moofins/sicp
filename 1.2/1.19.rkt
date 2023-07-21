#lang racket

;; a'' = (bp + aq)*q + (bq + aq + ap)*q + (bq + aq + ap)*p
;; a'' = bpq + aqq + bqq + aqq + apq + bqp + agp + app
;; a'' = b(pq + qq + qp) + a(qq + pp) + a(qq + pq + qp)
;; b'' = (bp + aq)*p + (bq + aq + ap)*q
;; b'' = bpp + aqp + bqq + aqq + apq
;; b'' = b(pp + qq) + a(qp + qq + pq)
;; p' = pp + qq
;; q' = qp + qq + pq = 2qp + qq
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p ) (* q q))   ; compute p'
                   (+ (* 2 q p ) (* q q)) ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
