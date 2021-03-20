; С использованием функционала для одномерного смешанного списка
(defun mult-els (lst num)
    (mapcar #'(lambda (arg) (cond 
                                ((numberp arg) (* arg num))
                                (t arg))) 
                                lst))

; С использованием функционала для структурированного смешанного списка
(defun mult-els-deep (lst num)
    (mapcar #'(lambda (arg) 
                      (cond 
                            ((listp arg) (mult-els-deep arg num))
                            ((numberp arg) (* arg num))
                            (t arg))) lst))

; Рекурсивно для одномерного смешанного списка
(defun mult-els-rec (lst num)
    (cond 
        ((null lst) nil)
        ((numberp (car lst)) (cons (* (car lst) num) (mult-els-rec (cdr lst) num)))
        (t (cons (car lst) (mult-els-rec (cdr lst) num)))))

; Рекурсивно для структурированного смешанного  списка
(defun mult-els-rec-deep (lst num)
    (cond
        ((null lst) nil)
        ((listp (car lst)) (cons (mult-els-rec-deep (car lst) num) (mult-els-rec-deep (cdr lst) num)))
        ((numberp (car lst)) (cons (* (car lst) num) (mult-els-rec-deep (cdr lst) num)))
        (t (cons (car lst) (mult-els-rec-deep (cdr lst) num)))))