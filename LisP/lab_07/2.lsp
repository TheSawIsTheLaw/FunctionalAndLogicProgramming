(defun is-in-set (lst el)
    (cond
        ((null lst) nil)
        ((equal (car lst) el) t)
        (t (is-in-set (cdr lst) el))))

(defun set-equal-inner (stF stS)
    (cond 
        ((null (cdr stF)) (is-in-set stS (car stF)))
        (t (and (is-in-set stS (car stF)) (set-equal-inner (cdr stF) stS)))))

(defun len (cdr-lst)
    (cond ((null cdr-lst) 0)
          (t (+ 1 (len (cdr cdr-lst))))))

; починил и добавил обёртку с проверкой длины
(defun set-equal (stF stS)
    (cond 
        ((= (len stF) (len stS)) (set-equal-inner stF stS))
        (t nil)))