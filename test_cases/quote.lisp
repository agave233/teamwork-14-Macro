(defmacro m1 ()    (+ 3 5))
(defmacro m2 ()   '(+ 3 5))
(defmacro m3 ()  ''(+ 3 5))
(defmacro m4 () '''(+ 3 5))

(print(m1))
(print(m2))
(print(m3))
(print(m4))