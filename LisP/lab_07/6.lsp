(defun swap-to-left (lst)
    (let ((out nil))
    (setf out (copy-list (cdr lst)))
    (setf (cdr (last out)) (cons (first lst) nil))
    out))

; Господи, хотел бы я пользоваться reverse
(defun swap-to-right (lst)
    (let ((out nil))
    (setf out (copy-list lst))
    (setf (cdr (last out)) out)
    (setf out (cdr (nthcdr (- (length lst) 2) out)))
    (setf (cdr (nthcdr (- (length lst) 1) out)) nil)
    out))