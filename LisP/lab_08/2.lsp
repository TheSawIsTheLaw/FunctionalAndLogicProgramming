; функция с хвостовой рекурсией
(defun select-rec (cur-lst down-limit up-limit)
    (cond ((null cur-lst) nil)
          ((and (<= (car cur-lst) up-limit) (>= (car cur-lst) down-limit)) (cons (car cur-lst) (select-rec (cdr cur-lst) down-limit up-limit)))
          (t (select-rec (cdr cur-lst) down-limit up-limit))))

; функция предподготовки
(defun select-between (lst fNum sNum)
    (let ((down-limit (cond ((< fNum sNum) fNum) (t sNum)))
          (up-limit (cond ((> fNum sNum) fNum) (t sNum))))
          
          (select-rec lst down-limit up-limit)))