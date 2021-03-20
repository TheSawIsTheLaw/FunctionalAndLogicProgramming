(defun rec-nth (index lst)
    (cond 
        ((null lst) nil)
        ((zerop index) (car lst))
        (t (rec-nth (- index 1) (cdr lst)))))