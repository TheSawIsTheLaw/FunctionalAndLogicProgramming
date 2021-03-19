`((Россия . Москва) (США . Вашингтон) (Украина . Киев))

(defun find-country (table capital)
    (cond ((null table) '(Такой столицы нет в таблице))
          ((eq (cdar table) capital) (caar table))
          (t (find-country (cdr table) capital))))

(defun find-capital (table country)
    (cond ((null table) '(Такой страны нет в таблице))
          ((eq (caar table) country) (cdar table))
          (t (find-capital (cdr table) country))))
