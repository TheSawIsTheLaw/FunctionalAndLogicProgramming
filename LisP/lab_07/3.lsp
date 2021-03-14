`((Россия . Москва) (США . Вашингтон) (Украина . Киев))

(defun find-country (table capital)
    (cond ((< (length table) 1) '(Такой столицы нет в таблице))
          ((eq (cdar table) capital) (caar table))
          (t (find-country (cdr table) capital))))

(defun find-capital (table country)
    (cond ((< (length table) 1) '(Такой страны нет в таблице))
          ((eq (caar table) country) (cdar table))
          (t (find-capital (cdr table) country))))
