; от 0 до n-го
(defun sum-to-n (lst to-n)
    (cond
        ((or (null lst) (< to-n 0)) 0)
        (t (+ (car lst) (sum-to-n (cdr lst) (- to-n 1))))))

; от n-го до первого < 0
(defun sum-to-lz (lst)
    (cond 
        ((or (null lst) (< (car lst) 0)) 0)
        (t (+ (car lst) (sum-to-lz (cdr lst))))))

(defun sum-from-n-to-lz (lst from-n)
    (cond 
        ((null lst) 0)
        ((> from-n 0) (sum-from-n-to-lz (cdr lst) (- from-n 1)))
        (t (sum-to-lz lst)))) ; я хотел бы добавить сюда дополняемую рекурсию, но тогда условжняется логика
                              ; первого условия, а это очень плохо

; от n-го до m с шагом h
(defun make-step (lst step-h)
    (cond 
        ((> step-h 0) (make-step (cdr lst) (- step-h 1)))
        (t lst)))

(defun sum-to-m (lst to step-h)
    (cond
        ((or (null lst) (< to 0)) 0)
        (t (+ (car lst) (sum-to-m (make-step lst step-h) (- to step-h) step-h)))))
; (sum-from-to-step '(1 0 3 1 5 0) 1 4 2) чини
(defun go-to-n (lst from to step-h)
    (cond
        ((null lst) 0)
        ((> from 0) (go-to-n (cdr lst) (- from 1) to step-h))
        (t (sum-to-m lst to step-h))))

(defun sum-from-to-step (lst from-n to-m step-h)
    (cond
        ((or (null lst) (= step-h 0)) 0)
        ((< from-n to-m) (go-to-n lst from-n (- to-m from-n) (abs step-h)))
        (t (go-to-n lst to-m (- from-n to-m) (abs step-h)))))