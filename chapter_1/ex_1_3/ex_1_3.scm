(define (square x)
  (* x x))

(define (sum_of_squares x y) (+ (square x) (square y)))

(define (big_check a b c)
  (cond ((and (>= (+ a b) (+ b c)) (>= (+ a b) (+ a c))) (sum_of_squares a b))
        ((and (>= (+ a c) (+ b c)) (>= (+ a c) (+ a b))) (sum_of_squares a c))
        (else (sum_of_squares b c))
  )
)

(big_check 2 1 3)
