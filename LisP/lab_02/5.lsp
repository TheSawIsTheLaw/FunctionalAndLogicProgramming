(defun firstFunction (ar1 ar2 ar3 ar4) (cons (cons ar1 (cons ar2 Nil)) (cons (cons ar3 (cons ar4 Nil)) Nil))) ; (f ar1 ar2 ar3 ar4) -> ((ar1 ar2) (ar3 ar4))
(print (firstFunction 4 3 2 1))

(defun secondFunction (ar1 ar2) (cons (cons ar1 Nil) (cons (cons ar2 Nil) Nil))) ; (f ar1 ar2) -> ((ar1) (ar2))
(print (secondFunction 3 1))

(defun thirdFunction (ar1) (cons (cons (cons ar1 Nil) Nil) Nil)) ; (f ar1) -> (((ar1)))
(print (thirdFunction 333))