domains
    list = integer*.

predicates
    listLen(list, integer).
    listLenInner(list, integer, integer).

    listSum(list, integer).
    listSumInner(list, integer, integer).

    listOddSum(list, integer).
    listOddSumInner(list, integer, integer).

clauses
    listLenInner([], OutAnswer, CurAnswer) :- OutAnswer = CurAnswer, !.
    listLenInner([_|T], OutAnswer, CurAnswer) :-
                            TempAnswer = CurAnswer + 1,
                            listLenInner(T, OutAnswer, TempAnswer).
                            
    listLen(List, Answ) :- listLenInner(List, Answ, 0).


    listSumInner([], OutAnswer, CurAnswer) :- OutAnswer = CurAnswer, !.
    listSumInner([H|T], OutAnswer, CurAnswer) :-
                                    TempAnswer = CurAnswer + H,
                                    listSumInner(T, OutAnswer, TempAnswer).

    listSum(List, Answ) :- listSumInner(List, Answ, 0).

    
    listOddSumInner([], OutAnswer, CurAnswer) :- OutAnswer = CurAnswer, !.
    listOddSumInner([H|[_|TT]], OutAnswer, CurAnswer) :- 
                                    TempAnswer = CurAnswer + H,
                                    listOddSumInner(TT, OutAnswer, TempAnswer), !.
    listOddSumInner([H|_], OutAnswer, CurAnswer) :- OutAnswer = CurAnswer + H.

    listOddSum(List, Answ) :- listOddSumInner(List, Answ, 0).

goal
    % listLen([], Answer_);
    % listLen([1, 2, 3], Answer_);
    
    % listSum([1, 2, 3, 4, 5], Answer_);
    % listSum([1, 2, 3, 4, 5, -5], Answer_)
    
    listOddSum([], Answer_);
    listOddSum([1, 2, 3, 4, 5, 6, 7], Answer_)
    .