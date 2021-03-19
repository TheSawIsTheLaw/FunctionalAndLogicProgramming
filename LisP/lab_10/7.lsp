(defun get-sqr-list (lst)
    (cond
        ((null lst) nil)
        (t (cons (* (car lst) (car lst)) (get-sqr-list (cdr lst))))))