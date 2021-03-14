(defun swap-two-elements (lst indF indS)
    (and
        (and (>= indF 0) (>= indS 0) (< indF (length lst)) (< indS (length lst)))
        (setf (nth indF lst) (cons (nth indF lst) (nth indS lst)))
        (setf (nth indS lst) (car (nth indF lst))) 
        (setf (nth indF lst) (cdr (nth indF lst)))) 
        lst)

(defun swap-two-elements (lst indF indS)
    (let 
        ((fEl (nthcdr indF lst))
        (temp nil) 
        (sEl (nthcdr indS lst)))

        (and 
            (and (>= indF 0) (>= indS 0) (< indF (length lst)) (< indS (length lst)))
            (setf temp (car fEl))
            (setf (car fEl) (car sEl))
            (setf (car sEl) temp))
        lst))