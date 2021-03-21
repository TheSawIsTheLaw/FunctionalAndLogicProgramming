; без работы со структурированными смешанными списками
(defun rec-add-inner (lst acc)
    (cond 
        ((null (cdr lst)) (+ acc (car lst)))
        (t (rec-add-inner (cdr lst) (+ acc (car lst))))))

(defun rec-add (lst)
    (rec-add-inner lst 0))

; либо
(defun rec-add (lst)
    (cond
        ((null (cdr lst)) (car lst))
        (t (+ (car lst) (rec-add (cdr lst))))))

; с обработкой смешных структурированных списков
(defun rec-add-inner (lst acc)
    (cond
        ((null lst) acc)
        ((listp (car lst)) (rec-add-inner (cdr lst) (+ acc (rec-add-inner (car lst) 0))))
        ((numberp (car lst)) (rec-add-inner (cdr lst) (+ acc (car lst))))
        (t (rec-add-inner (cdr lst) acc))))

(defun rec-add (lst)
    (rec-add-inner lst 0))

; либо
(defun rec-add (lst)
    (cond
        ((null lst) 0)
        ((symbolp (car lst)) (rec-add (cdr lst)))
        ((listp (car lst)) (+ (rec-add (car lst)) (rec-add (cdr lst))))
        ((numberp (car lst)) (+ (car lst) (rec-add (cdr lst))))))
