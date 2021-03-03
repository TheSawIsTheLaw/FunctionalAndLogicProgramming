;ifs
(defun isBetweenIf (fNum sNum tNum) (
    if (> fNum sNum) (if (< fNum tNum) t)
))

;conds
(defun isBetweenCond (fNum sNum tNum) (
    cond ((> fNum sNum) (cond ((< fNum tNum) t)))
))

;or
(defun isBetweenOr (fNum sNum tNum) (
    and (> fNum sNum) (< fNum tNum)
))