; без работы со структурированными смешанными списками
(defun rec-add (lst)
    (cond
        ((null lst) 0)
        (t (+ (car lst) (rec-add (cdr lst))))))

; с обработкой смешных структурированных списков
(defun rec-add (lst)
    (cond
        ((null lst) 0)
        ((symbolp (car lst)) (rec-add (cdr lst)))
        ((listp (car lst)) (+ (rec-add (car lst)) (rec-add (cdr lst))))
        ((numberp (car lst)) (+ (car lst) (rec-add (cdr lst))))))