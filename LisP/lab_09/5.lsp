(defun get-sqr-list (lst)
    (cond 
        ((null lst) nil)
        ((listp (car lst)) (cons (get-sqr-list (car lst)) (get-sqr-list (cdr lst))))
        ((numberp (car lst)) (cons (* (car lst) (car lst)) (get-sqr-list (cdr lst))))
        (t (get-sqr-list (cdr lst)))))

(defun get-sqr-helper (el)
    (cond
        ((listp el) (cons (get-sqr-list-fun el) nil))
        ((numberp el) (cons (* el el) nil))
        (t nil)))

(defun get-sqr-list-fun (lst)
    (mapcan #'get-sqr-helper lst))