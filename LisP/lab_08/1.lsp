(defun mult-els (lst num)
    (mapcar #'(lambda (arg) (* arg num)) lst))

(defun mult-els-deep (lst num)
    (mapcar #'(lambda (arg) 
                      (cond 
                            ((listp arg) (mult-els-deep arg num))
                            ((numberp arg) (* arg num))
                            (t arg))) lst))