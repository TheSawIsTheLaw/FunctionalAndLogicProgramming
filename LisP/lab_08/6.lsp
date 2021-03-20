; для работы с одноуровневым смешанным списком с использованием функционала
(defun sum-all-nums (lst)
    (reduce (lambda (accum cur-element)
                    (cond 
                        ((numberp cur-element) (+ accum cur-element))
                        (t accum)))
            (cons 0 lst)))

; для работы со смешанным структурированным списком с использованием функционала
(defun sum-all-nums-deep (lst)
    (reduce (lambda (accum cur-element)
                      (cond ((numberp cur-element) (+ accum cur-element))
                            ((listp cur-element) (+ accum (sum-all-nums-deep cur-element)))
                            (t accum)))
            (cons 0 lst)))

; для работы с одноуровневым смешанным списком рекурсивно
(defun sum-all-nums-rec (lst)
    (cond 
        ((null lst) 0)
        ((numberp (car lst)) (+ (car lst) (sum-all-nums-rec (cdr lst))))
        (t (+ 0 (sum-all-nums-rec (cdr lst))))))

; для работы со структурированным смешанным списком рекурсивно
(defun sum-all-nums-rec-deep (lst)
    (cond 
        ((null lst) 0)
        ((numberp (car lst)) (+ (car lst) (sum-all-nums-rec-deep (cdr lst))))
        ((listp (car lst)) (+ (sum-all-nums-rec-deep (car lst)) (sum-all-nums-rec-deep (cdr lst))))
        (t (sum-all-nums-rec-deep (cdr lst)))))