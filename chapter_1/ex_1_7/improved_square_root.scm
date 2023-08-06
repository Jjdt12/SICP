(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; There are fancier ways to do this but we will just improve until they match based on
; the tolerence of the type ¯\_(ツ)_/¯
(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (sqrt x)
  (sqrt-iter 1.0 x))
