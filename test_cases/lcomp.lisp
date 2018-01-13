;; the following two functions just make equivalent of Python's range function
;; you can safely ignore them unless you are running this code
(defun range-helper (x)
  (if (= x 0)
      (list x)
      (cons x (range-helper (- x 1)))))

(defun range (x)
  (reverse (range-helper (- x 1))))

;; equivalent to the python example:
;; define a variable
(defvar divisibleByTwo nil)

;; loop from 0 upto and including 9
(loop for x in (range 10)
   ;; test for divisibility by two
   if (= (mod x 2) 0)
   ;; append to the list
   do (setq divisibleByTwo (append divisibleByTwo (list x))))

(defmacro lcomp (expression for var in list conditional conditional-test)
  ;; create a unique variable name for the result
  (let ((result (gensym)))
    ;; the arguments are really code so we can substitute them
    ;; store nil in the unique variable name generated above
    `(let ((,result nil))
       ;; var is a variable name
       ;; list is the list literal we are suppose to iterate over
       (loop for ,var in ,list
            ;; conditional is if or unless
            ;; conditional-test is (= (mod x 2) 0) in our examples
            ,conditional ,conditional-test
            ;; and this is the action from the earlier lisp example
            ;; result = result + [x] in python
            do (setq ,result (append ,result (list ,expression))))
           ;; return the result
       ,result)))

(print (lcomp x for x in (range 10) if (= (mod x 2) 0)))