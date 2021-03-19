(defun ret-last-odd-inner (lst num)
    (cond
        ((null lst) num)
        (t (ret-last-odd-inner (cdr lst) (cond 
                                            ((oddp (car lst)) (car lst))
                                            (t num))))))

(defun ret-last-odd (lst)
    (ret-last-odd-inner lst nil))