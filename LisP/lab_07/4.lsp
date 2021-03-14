(defun swap-first-last (lst)
    (and 
        (setf (first lst) (cons (first lst) (car (last lst))))
        (setf (car (last lst)) (car (first lst))) 
        (setf (first lst) (cdr (first lst)))) 
        lst)

(defun swap-first-last (lst)
    (let 
        ((temp (car lst))
        (lastEl (last lst)))

        (setf (car lst) (car lastEl))
        (setf (car lastEl) temp)
        lst))