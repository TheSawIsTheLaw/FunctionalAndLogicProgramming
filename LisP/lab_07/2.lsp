(defun is-in-set (lst el)
    (cond
        ((null lst) nil)
        ((equal (car lst) el))
        (t (is-in-set (cdr lst) el))))

(defun set-equal-inner (stF stS)
    (cond
        ((null (cdr stF)) (is-in-set stS (car stF)))
        ((is-in-set stS (car stF)) (set-equal-inner (cdr stF) stS))))

; Функция, пародирующая поведение length
(defun len-inner (lst acc)
    (cond
        ((null lst) acc)
        (t (len-inner (cdr lst) (+ acc 1)))))

(defun len (lst)
    (len-inner lst 0))
;//

(defun set-equal (stF stS)
    (cond 
        ((= (len stF) (len stS)) (set-equal-inner stF stS))))