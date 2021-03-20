; для одномерного смешанного списка с использованием функционала
(defun reduce-numbers-by-10 (lst)
    (mapcar #'(lambda (element) 
              (cond ((numberp element) (- element 10))
                    (t element)))
            lst))

; для структурированного смешанного списка с использованием функционала
(defun my-mc-function (element)
    (cond
        ((numberp element) (- element 10))
        ((listp element) (reduce-numbers-by-10-deep element))
        (t element)))

(defun reduce-numbers-by-10-deep (lst)
    (mapcar #'my-mc-function lst))

; Рекурсивно для смешанного одномерного списка
(defun reduce-numbers-by-10-rec (lst)
    (cond
        ((null lst) nil)
        ((numberp (car lst)) (cons (- (car lst) 10) (reduce-numbers-by-10-rec (cdr lst))))
        (t (cons (car lst) (reduce-numbers-by-10-rec (cdr lst))))))

; Рекурсивно для структурированного смешанного списка
(defun reduce-numbers-by-10-rec-deep (lst)
    (cond
        ((null lst) nil)
        ((listp (car lst)) (cons (reduce-numbers-by-10-rec-deep (car lst)) (reduce-numbers-by-10-rec-deep (cdr lst))))
        ((numberp (car lst)) (cons (- (car lst) 10) (reduce-numbers-by-10-rec-deep (cdr lst))))
        (t (cons (car lst) (reduce-numbers-by-10-rec-deep (cdr lst))))))