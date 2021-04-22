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
    factorial(1, Answer_);
    factorial(2, Answer_);
    factorial(3, Answer_);
    factorial(4, Answer_);
    factorial(5, Answer_);
    factorial(6, Answer_);
    factorial(7, Answer_);
    factorial(8, Answer_);
    fibbo(1, Answer);
    fibbo(2, Answer);
    fibbo(3, Answer);
    fibbo(4, Answer);
    fibbo(5, Answer);
    fibbo(6, Answer);
    fibbo(7, Answer);
    fibbo(8, Answer)
    .