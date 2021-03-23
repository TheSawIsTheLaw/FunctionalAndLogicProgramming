; для работы со смешанным структурированным списком с использованием функционала
(defun sum-all-nums-deep (lst)
    (reduce (lambda (accum cur-element)
                      (cond ((numberp cur-element) (+ accum cur-element))
                            ((listp cur-element) (+ accum (sum-all-nums-deep cur-element)))
                            (t accum)))
            (cons 0 lst)))

; для работы со структурированным смешанным списком рекурсивно
(defun sum-all-nums-rec-deep-inner (lst acc)
    (cond
        ((null lst) acc)
        ((numberp (car lst)) (sum-all-nums-rec-deep-inner (cdr lst) (+ acc (car lst))))
        ((listp (car lst)) (sum-all-nums-rec-deep-inner (cdr lst) (+ acc (sum-all-nums-rec-deep-inner (car lst) 0))))
        (t (sum-all-nums-rec-deep-inner (cdr lst) acc))))

(defun sum-all-nums-rec-deep (lst)
    (sum-all-nums-rec-deep-inner lst 0))