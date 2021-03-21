; С использованием рекурсии для списка, содержащего только числа
(defun select-rec (cur-lst down-limit up-limit)
    (cond 
        ((null cur-lst) nil)
        ((and
            (<= (car cur-lst) up-limit) 
            (>= (car cur-lst) down-limit)) 
                (cons (car cur-lst) (select-rec (cdr cur-lst) down-limit up-limit)))
        (t (select-rec (cdr cur-lst) down-limit up-limit))))

; Для структурированных смешанных списков
(defun select-rec (cur-lst down-limit up-limit)
    (cond 
        ((null cur-lst) nil)
        ((listp (car cur-lst)) (cons (select-rec (car cur-lst) down-limit up-limit) (select-rec (cdr cur-lst) down-limit up-limit)))
        ((and 
            (numberp (car cur-lst)) 
            (<= (car cur-lst) up-limit) 
            (>= (car cur-lst) down-limit)) 
                (cons (car cur-lst) 
                                (select-rec (cdr cur-lst) down-limit up-limit)))
        (t (select-rec (cdr cur-lst) down-limit up-limit))))

; обёрточная функция
(defun select-between (lst fNum sNum)
    (let ((down-limit (cond ((< fNum sNum) fNum) (t sNum)))
          (up-limit (cond ((>= fNum sNum) fNum) (t sNum))))
          
          (select-rec lst down-limit up-limit)))

; С использованием функционалов для списка, содержащего только числа
(defun select-between-fun (lst fNum sNum)
    (cond
        ((< fNum sNum) (remove-if-not (lambda (el) (and (>= el fNum) (<= el sNum))) lst))
        (t (remove-if-not (lambda (el) (and (<= el fNum) (>= el sNum))) lst))))

; С использованием функционалов для структурированного смешанного списка
(defun select-between-fun-deep (lst fNum sNum)
    (mapcan #'(lambda (el) 
                        (cond
                            ((listp el) (cons (select-between-fun-deep el fNum sNum) nil))
                            (t (and (numberp el) (>= el fNum) (<= el sNum) (cons el nil))))) lst))