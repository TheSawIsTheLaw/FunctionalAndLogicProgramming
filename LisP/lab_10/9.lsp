'(
    ((fio . Jasurbek_Mihailov) (salary . 3000) (age . 30) (pos . Manager))
    ((fio . Torwalds_Linus) (salary . 3) (age . 25) (pos . Director))
    ((fio . Karl_Marx) (salary . 300) (age . 55) (pos . Manager))
    ((fio . Dmitry_Yakuba) (salary . 500) (age . 20) (pos . Suicider))
    ((fio . Stanislav_Borisov) (salary . 10000000000) (age . 75) (pos . Director))
    ((fio . Pavel_Pepperoni) (salary . 20000000000) (age . 20) (pos . Tech_Lead))
    ((fio . Kolima_Lenin) (salary . 100) (age . 53) (pos . Tech_Writer)))

(defun get-val-by-key (key row)
    (cond
        ((null row) nil)
        ((equal (caar row) key) (cdar row))
        (t (get-val-by-key key (cdr row)))))

(defun by-key-no-cdr (key row)
    (cond
        ((null row) nil)
        ((equal (caar row) key) (car row))
        (t (by-key-no-cdr key (cdr row)))))

(defun change-salary-with-cond (table col-name predicate salaryFun)
    (cond 
        ((null table) 'done)
        ((funcall predicate (get-val-by-key col-name (car table))) 
            (and 
                (rplacd (by-key-no-cdr 'salary (car table)) (funcall salaryFun (get-val-by-key 'salary (car table))))
                (change-salary-with-cond (cdr table) col-name predicate salaryFun)))
        (t (change-salary-with-cond (cdr table) col-name predicate salaryFun))))

(change-salary-with-cond table 'pos #'(lambda (got-pos) (equal 'Manager got-pos)) #'(lambda (sal) (setf sal (/ sal 2))))

(defun get-sum-salary-inner (table acc)
    (cond
        ((null table) acc)
        (t (get-sum-salary-inner (cdr table) (+ acc (get-val-by-key 'salary (car table)))))))

(defun get-sum-salary (table)
    (get-sum-salary-inner table 0))