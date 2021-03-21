; (defun swap-first-last (lst)
    ; (and 
        ; (setf (first lst) (cons (first lst) (car (last lst))))
        ; (setf (car (last lst)) (car (first lst))) 
        ; (setf (first lst) (cdr (first lst)))) 
        ; lst)
; нравится мне эта идея, но не получается формировать out-list
; (defun swap-first-last-inner (lst out-list first-el)
    ; (cond 
        ; ((null (cdr lst)) (cons (car lst) (cons out-list (cons first-el nil))))
        ; (t (swap-first-last-inner (cdr lst) (cons out-list (car lst)) first-el))))

; можно было бы переписать на хвостовую рекурсию, но нельзя использовать nconc и setf,
; который эффективно (без копирования) может работать только с использованием setf.
(defun my-last (lst)
    (cond
        ((null (cdr lst)) lst)
        (t (my-last (cdr lst)))))

(defun swap-first-last-inner (lst first-el)
    (cond
        ((null (cdr lst)) (cons first-el nil))
        (t (cons (car lst) (swap-first-last-inner (cdr lst) first-el)))))

(defun swap-first-last (lst)
    (cons (car (my-last lst)) (swap-first-last-inner (cdr lst) (car lst))))

; Хвостовая рекурсия
(defun swap-first-last-nconc-inner (lst f-el out-list)
    (cond
        ((null (cdr lst)) (nconc (cons (car lst) nil) out-list f-el))
        (t (swap-first-last-nconc-inner (cdr lst) f-el (nconc out-list (cons (car lst) nil))))))

(defun swap-first-last-nconc (lst)
    (swap-first-last-nconc-inner (cdr lst) (cons (car lst) nil) nil))

; (defun swap-first-last (lst)
    ; (let 
        ; ((temp (car lst))
        ; (lastEl (last lst)))

        ; (setf (car lst) (car lastEl))
        ; (setf (car lastEl) temp)
        ; lst))