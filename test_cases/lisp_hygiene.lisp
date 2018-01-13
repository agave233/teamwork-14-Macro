(defmacro my-unless (condition &body body)
    `(if (not ,condition)
       (progn
         ,@body)))

(flet ((not (x) x))
     (my-unless t
       (format t "This should not be printed!")))