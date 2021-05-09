predicates
    factorial(integer, integer).
    factorialInner(integer, integer, integer).

    fibbo(integer, integer).
    fibboInner(integer, integer, integer, integer).

clauses
    factorialInner(Number, Answer, NewAnswer) :- Number <= 0, Answer = NewAnswer, !.
    factorialInner(Number, Answer, NewAnswer) :-
    				    TempAnswer = NewAnswer * Number,
                        TempNumber = Number - 1,
                        factorialInner(TempNumber, Answer, TempAnswer).

    factorial(Number, Answer) :- factorialInner(Number, Answer, 1).

    fibboInner(Number, Answer, PrevAnswer, _) :- Number < 2, Answer = PrevAnswer, !.
    fibboInner(Number, Answer, PrevPrevAnswer, PrevAnswer) :-
                        TempNumber = Number - 1,
                        NewPrev = PrevPrevAnswer + PrevAnswer,
                        fibboInner(TempNumber, Answer, PrevAnswer, NewPrev).


    fibbo(Number, Answer) :- fibboInner(Number, Answer, 1, 1).

goal
    factorial(1, Answer_); % 1
    factorial(2, Answer_); % 2
    factorial(3, Answer_); % 6
    factorial(4, Answer_); % 24
    factorial(5, Answer_); % 120
    factorial(6, Answer_); % 720
    factorial(7, Answer_); % 5040
    factorial(8, Answer_); % 40320
    fibbo(1, Answer_); % 1
    fibbo(2, Answer_); % 1
    fibbo(3, Answer_); % 2
    fibbo(4, Answer_); % 3
    fibbo(5, Answer_); % 5
    fibbo(6, Answer_); % 8
    fibbo(7, Answer_); % 13
    fibbo(8, Answer_)  % 21
    .