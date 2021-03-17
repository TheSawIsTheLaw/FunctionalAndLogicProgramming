(defun allodr-inner (lst)
    (cond 
        ((null lst) t)
        ((symbolp (car lst)) nil)
        (t (and (oddp (car lst)) (allodr-inner (cdr lst))))))

(defun allodr (lst)
    (cond
        ((or (null lst) (symbolp (car lst))) nil)
        (t (and (oddp (car lst)) (allodr-inner (cdr lst))))))