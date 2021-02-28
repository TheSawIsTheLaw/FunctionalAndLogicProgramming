(defun getSortedPair (fNum sNum) (
    cond ((<= fNum sNum) (cons fNum (cons sNum Nil)))
    (t (cons sNum (cons fNum Nil)))
))