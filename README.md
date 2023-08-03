# SICP
Chapter exercises, .scm files available in chapter directories. 


<h1> Chapter 1 </h1> 

**Exercise 1.1:** Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.

```
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
```

**ANSWER**

```
10
12
8
3
6
BLANK
BLANK
19
#f  (False)
4
16
6
16
```

**Exercise 1.2:** Translate the following expression into prefix form:

![](/images/1_2_exp.png)


**ANSWER**

```
(/ (+ (+ 4 5) (- 2
                 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (* (- 6 2)(- 2 7))))
```
**Exercise 1.3:**  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

**ANSWER**

```
(define (sum_of_squares x y)
  (+ (* x x) (* y y)))

(define (big_check a b c) 
  (if (and (> a c) (> b c))
  (if (> b c) 
    (sum_of_squares a b)
    (sum_of_squares a c))
  (sum_of_squares b c)))

(big_check 2 1 3)
```
**Exercise 1.4:** Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

```
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

**ANSWER**

```
If b is greater then zero, set add a and b
Else subtract b from a. 
```

