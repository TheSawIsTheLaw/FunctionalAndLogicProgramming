; описанные функции возвращают T при факте передачи в них пустых списков.
; в случае, если потребуется, чтобы при первичной передаче пустого списка
; возвращался nil - достаточно добавить обёрточную функцию с первым условием cond

; без работы с структурированными смешанными списками
(defun allodr (lst)
    (cond 
        ((null lst) t)
        (t (and (oddp (car lst)) (allodr-inner (cdr lst))))))

; для работы с структурированными смешанными списками
(defun allodr (lst)
    (cond
        ((null lst) t)
        ((listp (car lst)) (allodr (car lst)))
        ((symbolp (car lst)) (allodr (cdr lst)))
        (t (and (oddp (car lst)) (allodr (cdr lst))))))