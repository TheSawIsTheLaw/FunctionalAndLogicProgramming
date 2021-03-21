; В случае, если список состоит только из одноуровневых списков, можно не использовать рекурсию,
; но указанная функция работает для всех уровней
(defun sum-len (lst)
    (reduce (lambda (accum cur-el) (cond ((listp cur-el) (+ accum (sum-len cur-el)))
                                         (t (+ accum 1)))) (cons 0 lst)))

; Только рекурсивное решение для смешанного неструктурированного списка
(defun sum-len-rec-inner (lst acc)
    (cond
        ((null lst) acc)
        ((listp (car lst)) (sum-len-rec-inner (cdr lst) (+ acc (sum-len-rec-inner (car lst) 0))))
        (t (sum-len-rec-inner (cdr lst) (+ acc 1)))))

(defun sum-len-rec (lst)
    (sum-len-rec-inner lst 0))

; Функция len, пародирующая поведение length, но возвращающая 1 на переданные значения
; (defun len-inner (lst acc)
;     (cond 
;         ((null lst) acc)
;         (t (len-inner (cdr lst) (+ acc 1)))))