(defun select-odd (lst)
    (cond 
        ((null lst) nil)
        ((oddp (car lst)) (cons (car lst) (select-odd (cdr lst))))
        (t (select-odd (cdr lst)))))

(defun sum-all-odd-inner (lst acc)
    (cond 
        ((null lst) acc)
        ((and (numberp (car lst)) (oddp (car lst))) (sum-all-odd-inner (cdr lst) (+ acc (car lst))))
        (t (sum-all-odd-inner (cdr lst) acc))))

(defun sum-all-odd (lst)
    (sum-all-odd-inner lst 0))

(defun select-even (lst)
    (cond 
        ((null lst) nil)
        ((evenp (car lst)) (cons (car lst) (select-even (cdr lst))))
        (t (select-even (cdr lst)))))

(defun sum-all-even-inner (lst acc)
    (cond
        ((null lst) acc)
        ((and (numberp (car lst)) (evenp (car lst))) (sum-all-even-inner (cdr lst) (+ acc (car lst))))
        (t (sum-all-even-inner (cdr lst) acc))))

(defun sum-all-even (lst)
    (sum-all-even-inner lst 0))