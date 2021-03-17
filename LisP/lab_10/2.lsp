(defun rec-nth (index lst)
    (cond 
        ((or (null lst) (< index 0)) nil)
        ((zerop index) (car lst))
        (t (rec-nth (- index 1) (cdr lst)))))