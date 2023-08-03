(define (sum_of_squares x y)
  (+ (* x x) (* y y)))

(define (big_check a b c) 
  (if (and (> a c) (> b c))
  (if (> b c) 
    (sum_of_squares a b)
    (sum_of_squares a c))
  (sum_of_squares b c)))

(big_check 2 1 3)
