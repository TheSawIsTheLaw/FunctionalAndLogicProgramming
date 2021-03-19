(defun select-odd (lst)
    (cond 
        ((null lst) nil)
        ((oddp (car lst)) (cons (car lst) (select-odd (cdr lst))))
        (t (select-odd (cdr lst)))))

(defun sum-all-odd (lst)
    (cond
        ((null lst) 0)
        ((evenp (car lst)) (sum-all-odd (cdr lst)))
        (t (+ (car lst) (sum-all-odd (cdr lst))))))

(defun select-even (lst)
    (cond 
        ((null lst) nil)
        ((evenp (car lst)) (cons (car lst) (select-even (cdr lst))))
        (t (select-even (cdr lst)))))


(defun sum-all-even (lst)
    (cond
        ((null lst) 0)
        ((oddp (car lst)) (sum-all-even (cdr lst)))
        (t (+ (car lst) (sum-all-even (cdr lst))))))
