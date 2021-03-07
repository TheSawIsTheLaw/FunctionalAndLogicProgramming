(defun isBetween (fNum sNum tNum) (
    or (and (< fNum sNum) (> fNum tNum)) (and (> fNum sNum) (< fNum tNum))
))