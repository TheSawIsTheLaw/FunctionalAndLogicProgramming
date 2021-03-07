; с использованием функции reverse
(defun retWOLast (lst) (
    reverse (cdr (reverse lst))
))

; с использованием рекурсии
(defun retWOLast (lst) (
    if (null (cdr lst))
    nil
    (cons (car lst) (retWOLast (cdr lst)))
))