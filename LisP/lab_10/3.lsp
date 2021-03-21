; описанные функции возвращают T при факте передачи в них пустых списков.
; в случае, если потребуется, чтобы при первичной передаче пустого списка
; возвращался nil - достаточно добавить обёрточную функцию с первым условием cond

; без работы с структурированными смешанными списками
(defun allodr-tail-inner (lst cur-bool)
    (cond
        ((null cur-bool) nil)
        ((null lst))
        (t (allodr-tail-inner (cdr lst) (oddp (car lst))))))

(defun allodr-tail (lst)
    (allodr-tail-inner lst t))

; для работы с структурированными смешанными списками
(defun allodr-tail-inner (lst cur-bool)
    (cond
        ((null cur-bool) nil)
        ((null lst))
        ((listp (car lst)) (and (allodr-tail-inner (car lst) t) (allodr-tail-inner (cdr lst) cur-bool)))
        ((numberp (car lst)) (allodr-tail-inner (cdr lst) (oddp (car lst))))
        (t (allodr-tail-inner (cdr lst) cur-bool))))

(defun allodr-tail (lst)
    (allodr-tail-inner lst t))