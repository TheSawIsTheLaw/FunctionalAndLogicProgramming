; if
(defun how_alike (x y)
    (if (if (= x y) t (equal x y))
    `the_same
    (if (if (oddp x) (oddp y)) 
    `both_odd
    (if (if (evenp x) (evenp y)) 
    `both_even 
    `difference))))

; and/or
(defun how_alike (x y)
    (or 
    (and (or (= x y) (equal x y)) `the_same)
    (and (oddp x) (oddp y) `both_odd)
    (and (evenp x) (evenp y) `both_even)
    `difference))