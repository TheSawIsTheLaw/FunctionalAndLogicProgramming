(defun trapezoid (baseTop baseBot height)
    (* height (/ (+ baseTop baseBot) 2.0)))

(trapezoid 2 3 4)
    2 вычисляется к 2
    3 вычисляется к 3
    4 вычисляется к 4
    вызов trapezoid с аргументами 2, 3, 4
    (* height (/ (+ baseTop baseBot) 2.0)) с аргументами 2, 3, 4
        создаётся baseTop со значением 2
        создаётся baseBot со значением 3
        создаётся height со значением 4
        height вычисляется к 4
        (/ (+ baseTop baseBot) 2)
            (+ baseTop baseBot)
                baseTop вычисляется к 2
                baseBot вычисляется к 3
                + применяется к 2 и 3
                5
            2 вычисляется к 2
            / применяется к 5 и 2
            2.5
        применяется * к 4 и 2.5
        10.0
    10.0