(defun my-nth (lst index)
    (cond 
        ((= 0 index) (car lst))
        (t (my-nth (cdr lst) (- index 1)))))

(defun len-inner (lst acc)
    (cond
        ((null lst) acc)
        (t (len-inner (cdr lst) (+ acc 1)))))

(defun len (lst)
    (len-inner lst 0))

; Функция прохода до конца списка
(defun swap-two-elements-nil (lst)
    (cond 
        ((null lst) nil)
        (t (cons (car lst) 
                        (swap-two-elements-nil (cdr lst))))))

; Функция прохода до второго индекса
(defun swap-two-elements-last (lst indS f-el)
    (cond
        ((= 0 indS) (cons f-el 
                            (swap-two-elements-nil (cdr lst))))
        (t (cons (car lst) 
                        (swap-two-elements-last (cdr lst) (- indS 1) f-el)))))

; Функция прохода до первого индекса
(defun swap-two-elements-inner (lst indF indS s-el)
    (cond 
        ((= 0 indF) (cons s-el 
                            (swap-two-elements-last (cdr lst) indS (car lst))))
        (t (cons (car lst) 
                        (swap-two-elements-inner (cdr lst) (- indF 1) indS s-el)))))

; Обёрточная функция
(defun swap-two-elements (lst indF indS)
    (and 
        (and (>= indF 0) (>= indS 0) (< indF (len lst)) (< indS (len lst)))
        (cond 
            ((< indF indS) 
                (swap-two-elements-inner lst indF (- indS indF 1) (my-nth lst indS)))
            (t (swap-two-elements-inner lst indS (- indF indS 1) (my-nth lst indF))))))

; (defun swap-two-elements (lst indF indS)
    ; (and
        ; (and (>= indF 0) (>= indS 0) (< indF (length lst)) (< indS (length lst)))
        ; (setf (nth indF lst) (cons (nth indF lst) (nth indS lst)))
        ; (setf (nth indS lst) (car (nth indF lst))) 
        ; (setf (nth indF lst) (cdr (nth indF lst)))) 
        ; lst)

; (defun swap-two-elements (lst indF indS)
    ; (let 
        ; ((fEl (nthcdr indF lst))
        ; (temp nil) 
        ; (sEl (nthcdr indS lst)))

        ; (and 
            ; (and (>= indF 0) (>= indS 0) (< indF (length lst)) (< indS (length lst)))
            ; (setf temp (car fEl))
            ; (setf (car fEl) (car sEl))
            ; (setf (car sEl) temp))
        ; lst))