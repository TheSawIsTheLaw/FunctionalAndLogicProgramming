(defun swap-first-last (lst)
    (and 
        (setf (first lst) (cons (first lst) (car (last lst))))
        (setf (car (last lst)) (car (first lst))) 
        (setf (first lst) (cdr (first lst)))) 
        lst)