 (define (cubert-iter guess prev-guess x) 
   (if (good-enough? guess prev-guess) 
       guess 
       (cubert-iter (improve guess x) guess x))) 
  
 (define (improve guess x) 
   (average-cube (/ x (square guess)) guess guess)) 
  
 (define (average-cube x y z) 
   (/ (+ x y z) 3)) 
  
 (define (good-enough? guess prev-guess) 
   (< (abs (- guess prev-guess)) (abs (* guess 0.001)))) 
  
 (define (cubert x) 
   (cubert-iter 1.0 0.0 x)) 
