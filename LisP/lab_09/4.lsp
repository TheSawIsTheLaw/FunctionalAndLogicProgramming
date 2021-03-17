; В случае, если список состоит только из одноуровневых списков, можно не использовать рекурсию,
; указанная функция работает для всех уровней
(defun sum-len (lst)
    (reduce (lambda (accum cur-el) (cond ((listp cur-el) (+ accum (sum-len cur-el)))
                                         (t (+ accum 1)))) (cons 0 lst)))

; личная функция len, породирующая поведение length
(defun len (cdr-lst)
    (cond ((null cdr-lst) 0)
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
          (t (+ (sum-len (car lst)) (sum-len (cdr lst))))))

; Ещё один подобный вариант с использованием собственной функции length
(defun sum-len (lst)
    (cond ((null lst) 0)
          (t (+ (len (car lst)) (sum-len (cdr lst))))))