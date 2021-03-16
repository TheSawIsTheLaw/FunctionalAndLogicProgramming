; не очень хвостовая рекурсия вообще-то...
(defun sum-all-nums (cur)
    (cond ((numberp cur) cur)
          ((symbolp cur) 0) ; Здесь можно не проверять на nil, так как (symbolp nil) -> T
          (t (+ (sum-all-nums (car cur)) (sum-all-nums (cdr cur))))))

; Похоже на хвостовую рекурсию
(defun sum-all-nums-tail (lst)
    (reduce (lambda (accum cur-element)
                      (cond ((numberp cur-element) (+ accum cur-element))

                            ((listp cur-element) (+ accum (sum-all-nums-tail cur-element)))
                            (t accum)))
            (cons 0 lst)))