; от 0 до n-го)
(defun sum-to-n-inner (lst to-n acc)
    (cond
        ((or (null lst) (< to-n 0)) acc)
        (t (sum-to-n-inner (cdr lst) (- to-n 1) (+ acc (car lst))))))

(defun sum-to-n (lst to-n)
    (sum-to-n-inner lst to-n 0))

; от n-го до первого < 0
(defun sum-to-lz-inner (lst acc)
    (cond
        ((or (null lst) (< (car lst) 0)) acc)
        (t (sum-to-lz-inner (cdr lst) (+ acc (car lst))))))

(defun sum-to-lz (lst)
    (sum-to-lz-inner lst 0))

; от n до первого < 0
(defun sum-from-n-to-lz-inner (lst from-n acc)
    (cond
        ((null lst) acc)
        ((> from-n 0) (sum-from-n-to-lz-inner (cdr lst) (- from-n 1) 0))
        ((< (car lst) 0) acc)
        (t (sum-from-n-to-lz-inner (cdr lst) 0 (+ acc (car lst))))))

(defun sum-from-n-to-lz (lst from-n)
    (sum-from-n-to-lz-inner lst from-n 0))

; от n-го до m с шагом h

; Функция выполнения шага
(defun make-step (lst step-h)
    (cond 
        ((> step-h 0) (make-step (cdr lst) (- step-h 1)))
        (t lst)))

; Суммируем и делаем шаг
(defun sum-to-m-with-step (lst to-m step-h acc)
    (cond 
        ((or (null lst) (< to-m 0)) acc)
        (t (sum-to-m-with-step (make-step lst step-h) (- to-m step-h) step-h (+ acc (car lst))))))

; Проход до n-го элемента списка и вызов подсчитывающей функции
(defun sum-from-to-step-inner (lst from-n to-m step-h)
    (cond
        ((null lst) 0)
        ((zerop from-n) (sum-to-m-with-step lst to-m step-h 0))
        (t (sum-from-to-step-inner (cdr lst) (- from-n 1) to-m step-h))))

; Подготовка вызова
(defun sum-from-to-step (lst from-n to-m step-h)
    (cond
        ((or (null lst) (= step-h 0) (< from-n 0) (< to-m 0)) 0)
        ((< from-n to-m) (sum-from-to-step-inner lst from-n (- to-m from-n) step-h))
        (t (sum-from-to-step-inner lst to-m (- from-n to-m) (abs step-h)))))