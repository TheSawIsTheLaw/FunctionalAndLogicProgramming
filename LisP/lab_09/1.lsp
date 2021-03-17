(defun select-rec (cur-lst down-limit up-limit)
    (cond   ((null cur-lst) nil)
            ((listp (car cur-lst)) (nconc (select-rec (car cur-lst) down-limit up-limit) (select-rec (cdr cur-lst) down-limit up-limit)))
            ((and (numberp (car cur-lst)) 
                  (<= (car cur-lst) up-limit) 
                  (>= (car cur-lst) down-limit)) 
                  (cons (car cur-lst) (select-rec (cdr cur-lst) down-limit up-limit)))
                  (t (select-rec (cdr cur-lst) down-limit up-limit))))
; (select-rec '(1 2 (3 4 #'+ 3) ad 3 2 zxcv) 1 3)

; функция предподготовки
(defun select-between (lst fNum sNum)
    (let ((down-limit (cond ((< fNum sNum) fNum) (t sNum)))
          (up-limit (cond ((> fNum sNum) fNum) (t sNum))))
          
          (select-rec lst down-limit up-limit)))