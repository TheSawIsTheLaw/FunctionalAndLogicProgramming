(defun ret-first-lst (lst)
    (cond ((null lst) lst)
          ((and (listp (car lst)) (not (null (car lst)))) (car lst))
          (t (ret-first-lst (cdr lst)))))

(defun ret-first-lst-fun (lst)
    (find-if #'(lambda (x) (and (listp x) (not (null x)))) lst))