; (defun swap-to-left (lst)
    ; (let ((out nil))
    ; (setf out (copy-list (cdr lst)))
    ; (setf (cdr (last out)) (cons (first lst) nil))
    ; out))

(defun my-last (lst)
    (cond
        ((null (cdr lst)) lst)
        (t (my-last (cdr lst)))))

(defun swap-to-left-inner (lst f-el)
    (cond
        ((null lst) (cons f-el nil))
        (t (cons (car lst) (swap-to-left-inner (cdr lst) f-el)))))

(defun swap-to-left (lst)
    (swap-to-left-inner (cdr lst) (car lst)))

(defun swap-to-right-inner (lst)
    (cond
        ((null (cdr lst)) nil)
        (t (cons (car lst) (swap-to-right-inner (cdr lst))))))

(defun swap-to-right (lst)
    (cons (my-last lst) (swap-to-right-inner lst)))

; (defun swap-to-right (lst)
    ; (let ((out nil))
    ; (setf out (copy-list lst))
    ; (setf (cdr (last out)) out)
    ; (setf out (cdr (nthcdr (- (length lst) 2) out)))
    ; (setf (cdr (nthcdr (- (length lst) 1) out)) nil)
    ; out))