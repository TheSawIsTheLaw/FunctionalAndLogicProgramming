(defun rollTheDices (numberOfEdges)
    (let ((sum (+ (random numberOfEdges) (random numberOfEdges) 2))) ; + 2 так как random генерируется число от нуля
    (and
        (print (list 'Сумма 'из 'броска sum))
        (if (or (= sum 2) (= sum 12)) 
            (and 
            (print '(Игрок получил возможность перебросить кости)) 
            (setq sum (rollTheDices numberOfEdges))) 
            sum)
        sum)))

(defun isWinByNumber (roll)
    (or (= roll 7) (= roll 11)))

(defun whoWon (fPlayerRoll sPlayerRoll) 
    (or 
        (if (isWinByNumber fPlayerRoll) '(Игрок 1 выиграл))
        (if (or (isWinByNumber sPlayerRoll) (> sPlayerRoll fPlayerRoll)) '(Игрок 2 выиграл))
        (if (> fPlayerRoll sPlayerRoll) '(Игрок 1 выиграл))
        'Ничья))

(defun playTheGame ()
    (print (whoWon (and 
                        (print '(Игрок 1 бросает кости)) 
                        (rollTheDices 6))
                   (and 
                        (print '(Игрок 2 бросает кости)) 
                        (rollTheDices 6)))))