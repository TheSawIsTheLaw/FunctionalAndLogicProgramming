; с использованием функции reverse
(defun retLast (lst) (
    car (reverse lst)
))

; с использованием рекурсии
(defun retLast (lst) (
    if (null (cdr lst)) 
    (car lst) 
    (retlast (cdr lst))
))

; с возвращением последнего элемента любого уровня
(defun retLastEnd (lst) (
    if (null (cdr lst)) 
    (let ((tempLst (car lst))) 
        (if (listp tempLst) 
        (retLastEnd tempLst) 
        tempLst
        )
    ) 
    (retLastEnd (cdr lst))
))