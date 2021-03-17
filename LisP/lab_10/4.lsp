(defun my-last (lst)
    (cond
        ((null (cdr lst)) lst)
        (t (my-last (cdr lst)))))