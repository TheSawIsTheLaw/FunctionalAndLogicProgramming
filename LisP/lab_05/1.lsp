(defun returnFirstBiggerEven (num) 
    (cond 
    ((evenp (+ num 1)) (+ num 1))
    (t num)))