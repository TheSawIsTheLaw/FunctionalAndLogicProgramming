(defun get-sqr-list (lst)
    (cond 
        ((null lst) nil)
        ((symbolp (car lst)) (get-sqr-list (cdr lst)))
        ((numberp (car lst)) (cons (* (car lst) (car lst)) (get-sqr-list (cdr lst))))
        (t (nconc (get-sqr-list (car lst)) (get-sqr-list (cdr lst))))))