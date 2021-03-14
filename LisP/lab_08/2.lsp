(defun select-between (lst fNum sNum)
    (let ((down-limit (cond ((< fNum sNum) fNum) (t sNum)))
          (up-limit (cond ((> fNum sNum) fNum) (t sNum)))
          (out-list nil))

        (mapcar #'(lambda (arg) (or (>= arg down-limit))))