(defun inner-reverse (lst-in lst-out)
    (cond 
        ((null lst-in) lst-out)
        (t (inner-reverse (cdr lst-in) (cons (car lst-in) lst-out)))))

(defun my-reverse (lst-in)
    (inner-reverse (cdr lst-in) (cons (car lst-in) nil)))

(defun isPal (lst)
    (equal lst (my-reverse lst)))