# SICP
Structures and Interpretation of Computer Programs chapter exercises

Book available in

HTML format here

`https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book.html`

PDF format here

`https://web.mit.edu/6.001/6.037/sicp.pdf`

.scm files available in chapter directories for relevent questions

For x86, use `mit-scheme` installed with:

Linux

`apt install mit-scheme` 

OSX

`brew install mit-scheme`

For ARM or Windows, use `racket` installed with:

OSX

`brew install racket`

Windows

`Download at https://download.racket-lang.org/`

<h1> Chapter 1 </h1> 


**Exercise 1.1:**
Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.

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
\
\
\
**Exercise 1.2:** Translate the following expression into prefix form:

![](/images/1_2_exp.png)


**ANSWER**

```
(/ (+ (+ 4 5) (- 2
                 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (* (- 6 2)(- 2 7))))
```
\
\
\
**Exercise 1.3:**  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

**ANSWER**

```
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
```
\
\
\
**Exercise 1.4:** Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

```
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

**ANSWER**

```
If b is greater then zero, add a and b
Else subtract b from a. 
```
\
\
\
**Exercise 1.5:** Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

```
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
```

Then he evaluates the expression

```
(test 0 (p))
```

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)

**ANSWER**

```
With applictive-order evaluation Ben will observe that the process 
repeats infinietly because (p) infinitely expands itself during evalutation. 

(test 0 (p))

(if (= x 0) 0 (p))

(p) is evaluated before applying resulting procedures so:

(p) is (p) is (p) is (p)...etc.

With normal-order evaluation Ben will observe that the interpreter does output 
a result, 0. This is because in normal-order evaluation operands are not evaluated
until their values are needed:

 (test 0 (p)) 
  
 (p) is not evaulated until/if it needed:

 (if (= 0 0) 0 (p)) 
  
 (if TRUE 0 (p)) 

 Since 0 = 0 evaluations to TRUE, then (p) is not evaluated. 
  
 Output: 0
```
\
\
\
**Exercise 1.6:** Alyssa P. Hacker doesn't see why if needs to be provided as a special form. "Why can't I just define it as an ordinary procedure in terms of cond?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

```
(define (new-if predicate then-clause else-clause)

  (cond (predicate then-clause)
        (else else-clause)))
```

Eva demonstrates the program for Alyssa:

```
(new-if (= 2 3) 0 5) 5

(new-if (= 1 1) 0 5) 0
```

Delighted, Alyssa uses new-if to rewrite the square-root program:

```
(define (sqrt-iter guess x)

  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
```

What happens when Alyssa attempts to use this to compute square roots? Explain.


**ANSWER**

```
'if' is a special form and does not evaluate the second predicate if the first 
predicate is true. The newly defined 'newif' is not a special form and thus is 
subject to applicitive-order evaluation; this causes an stack overflow when the 
iteration procecedure (sqrt-iter) is evaluated/called.
```
\
\
\
**Exercise 1.7:** The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

**ANSWER**

```
 ██████  ██████  ███    ███ ███████     ██████   █████   ██████ ██   ██      █████  ███    ██ ██████      
██      ██    ██ ████  ████ ██          ██   ██ ██   ██ ██      ██  ██      ██   ██ ████   ██ ██   ██     
██      ██    ██ ██ ████ ██ █████       ██████  ███████ ██      █████       ███████ ██ ██  ██ ██   ██     
██      ██    ██ ██  ██  ██ ██          ██   ██ ██   ██ ██      ██  ██      ██   ██ ██  ██ ██ ██   ██     
 ██████  ██████  ██      ██ ███████     ██████  ██   ██  ██████ ██   ██     ██   ██ ██   ████ ██████      
                                                                                                          
                                                                                                          
███████ ██ ███    ██ ██ ███████ ██   ██     ████████ ██   ██ ██ ███████                                   
██      ██ ████   ██ ██ ██      ██   ██        ██    ██   ██ ██ ██                                        
█████   ██ ██ ██  ██ ██ ███████ ███████        ██    ███████ ██ ███████                                   
██      ██ ██  ██ ██ ██      ██ ██   ██        ██    ██   ██ ██      ██                                   
██      ██ ██   ████ ██ ███████ ██   ██        ██    ██   ██ ██ ███████                                   
                                                                                                          
                                                                                                          
██    ██  ██████  ██    ██     ███████ ██████  ███████  █████  ██   ██ ██ ███    ██  ██████               
 ██  ██  ██    ██ ██    ██     ██      ██   ██ ██      ██   ██ ██  ██  ██ ████   ██ ██                    
  ████   ██    ██ ██    ██     █████   ██████  █████   ███████ █████   ██ ██ ██  ██ ██   ███              
   ██    ██    ██ ██    ██     ██      ██   ██ ██      ██   ██ ██  ██  ██ ██  ██ ██ ██    ██              
   ██     ██████   ██████      ██      ██   ██ ███████ ██   ██ ██   ██ ██ ██   ████  ██████               
                                                                                                          
                                                                                                          
██       █████  ███████ ██    ██     ██████  ██    ██ ███    ██  ██████ ███████  ██████  █████  ██████    
██      ██   ██    ███   ██  ██      ██   ██ ██    ██ ████   ██ ██      ██      ██      ██   ██ ██   ██   
██      ███████   ███     ████       ██   ██ ██    ██ ██ ██  ██ ██      █████   ██      ███████ ██████    
██      ██   ██  ███       ██        ██   ██ ██    ██ ██  ██ ██ ██      ██      ██      ██   ██ ██        
███████ ██   ██ ███████    ██        ██████   ██████  ██   ████  ██████ ███████  ██████ ██   ██ ██        

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

```

