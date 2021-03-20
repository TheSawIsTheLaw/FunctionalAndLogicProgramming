; В случае, если список состоит только из одноуровневых списков, можно не использовать рекурсию,
; но указанная функция работает для всех уровней
(defun sum-len (lst)
    (reduce (lambda (accum cur-el) (cond ((listp cur-el) (+ accum (sum-len cur-el)))
                                         (t (+ accum 1)))) (cons 0 lst)))

; Только рекурсивное решение
(defun sum-len-rec (lst)
    (cond
        ((null lst) 0)
        ((listp (car lst)) (+ (sum-len-rec (car lst)) (sum-len-rec (cdr lst))))
        (t (+ 1 (sum-len-rec (cdr lst))))))

; личная функция len, пародирующая поведение length
(defun len (cdr-lst)
    (cond ((null (cdr cdr-lst)) 1)
          (t (+ 1 (len (cdr cdr-lst))))))

; С наложенными ограничениями (с использованием функционала):
(defun sum-len (lst)
    (reduce 
        (lambda (accum-outer cur-el-outer) 
                (+ accum-outer (len cur-el-outer))) 
        (cons 0 lst)))

; С наложенными ограничениями (рекурсивно):
(defun sum-len (lst)
    (cond ((null lst) 0)
          ((numberp lst) 1)
          (t (+ (len (car lst)) (sum-len (cdr lst))))))