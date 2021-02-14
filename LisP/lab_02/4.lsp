(list `Fred `and Wilma) ;

(list `Fred `(and Wilma)) ; (FRED (AND WILMA))

(cons Nil Nil) ; (NIL)

(cons T Nil) ; (T)

(cons Nil T) ; (NIL . T)

(list Nil) ; (NIL)

(cons (T) Nil) ;

(list `(one two) `(free temp)) ; ((ONE TWO) (FREE TEMP))

(cons `Fred `(and Wilma)) ; (FRED AND WILMA)

(cons `Fred `(Wilma)) ; (FRED WILMA)

(list Nil Nil) ; (NIL NIL)

(list T Nil) ; (T NIL)

(list Nil T) ; (NIL T)

(cons T (list Nil)) ; (T NIL)

(list (T) Nil) ;

(cons `(one two) `(free temp)) ; ((ONE TWO) FREE TEMP)