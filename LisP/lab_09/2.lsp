; Рекурсивно
(defun dec-Prod-iter (f-el s-lst)
    (cond ((null s-lst) nil)
          (t (cons (cons f-el (car s-lst)) (dec-Prod-iter f-el (cdr s-lst))))))

(defun dec-Prod (f-lst s-lst)
    (cond ((null f-lst) nil)
          (t (cons (dec-Prod-iter (car f-lst) s-lst) (dec-Prod (cdr f-lst) s-lst)))))

; С использованием функционалов
(defun dec-Prod-func (f-lst s-lst)
    (mapcar (lambda (f-el) (mapcar (lambda (s-el) (cons f-el s-el)) s-lst)) f-lst))