; На деле эта функция работает не так, как лисповая. Дело в том, что она не разрушает структуру,
; так как запрещено пользоваться setf, который используется в реализации
; (defun my-nconc (f-lst s-lst)
    ; (cond 
        ; ((not (null f-lst)) (cons (car f-lst) (my-nconc (cdr f-lst) s-lst)))
        ; ((not (null s-lst)) (cons (car s-lst) (my-nconc nil (cdr s-lst))))
        ; (t nil)))
; Рекурсивно. Для смешанного списка.
(defun select-rec-one-lvl (lst down-limit up-limit)
    (cond 
        ((null lst) nil)
        ((and 
            (numberp (car lst)) 
            (<= (car lst) up-limit) 
            (>= (car lst) down-limit)) 
            (cons (car lst) (select-rec-one-lvl (cdr lst) down-limit up-limit)))
        (t (select-rec-one-lvl (cdr lst) down-limit up-limit))))

; Рекурсивно. Для смешанного структурированного списка.
(defun select-rec (lst down-limit up-limit)
    (cond
        ((null lst) nil)
        ((listp (car lst)) (cons (select-rec (car lst) down-limit up-limit)
                                 (select-rec (cdr lst) down-limit up-limit)))
        ((and
            (numberp (car lst))
            (<= (car lst) up-limit) 
            (>= (car lst) down-limit)) 
                (cons (car lst) (select-rec (cdr lst) down-limit up-limit)))
        (t (select-rec (cdr lst) down-limit up-limit))))
; (select-rec '(1 2 (3 4 #'+ 3) ad 3 2 zxcv) 1 3)

; С использованием функционала. Для смешанного списка.
(defun select-fun-one-lvl (lst down-limit up-limit)
    (remove-if-not #'(lambda (el) (and (numberp el) (<= el up-limit) (>= el down-limit))) lst))

; С использованием функционала. Для смешанного структурированного списка.
(defun select-fun (lst down-limit up-limit)
    (mapcan #'(lambda (el) (cond
                                ((listp el) (select-fun el down-limit up-limit))
                                ((and (numberp el) (<= el up-limit) (>= el down-limit) (cons el nil))))) lst))

; обёрточная функция для каждой из предоставленной выше функции
(defun select-between (lst fNum sNum)
    (let ((down-limit (cond ((< fNum sNum) fNum) (t sNum)))
          (up-limit (cond ((< fNum sNum) sNum) (t fNum))))
          (select-rec lst down-limit up-limit)))