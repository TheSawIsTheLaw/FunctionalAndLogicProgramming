domains
    list = integer*.

predicates
    append(list, list, list).

    listWithUpper(list, integer, list).

    oddPosList(list, list).

    deleteOneElement(list, integer, list).

    deleteAllElement(list, integer, list).

    includes(list, integer).
    makeSet(list, list).

clauses
    append([H|T], SList, [H|AddTail]) :- % AddTail will be set to resursion for its 'value'
                            append(T, SList, AddTail), % look for new value of AddTail
                            !.
    append([], SList, SList). % Just append last elements to a list

    listWithUpper([H|T], Num, [H|T2]) :-
                                H > Num,
                                listWithUpper(T, Num, T2),
                                !.
    listWithUpper([_|T], Num, OutList) :- listWithUpper(T, Num, OutList).
    listWithUpper([], _, []) :- !.

    oddPosList([H|[_|T]], [H|OutList]) :-
                                oddPosList(T, OutList),
                                !.
    oddPosList(List, List).

    deleteOneElement([H|T], El, [H|AddTail]) :-
                                El <> H,
                                !,
                                deleteOneElement(T, El, AddTail).
    deleteOneElement([H|T], H, T) :- !.
    deleteOneElement(List, _, List).

    deleteAllElement([H|T], El, AddTail) :-
                                El = H,
                                !,
                                deleteAllElement(T, El, AddTail).
    deleteAllElement([H|T], El, [H|AddTail]) :- 
                                deleteAllElement(T, El, AddTail),
                                !.
    deleteAllElement(List, _, List).

    includes([_|T], El) :- 
                                includes(T, El),
                                !.
    includes([H|_], H).

    makeSet([H|T], AddTail) :-
                                includes(T, H),
                                !,
                                makeSet(T, AddTail).
    makeSet([H|T], [H|AddTail]) :- makeSet(T, AddTail), !.
    makeSet(List, List).

goal
    makeSet([1, 2, 3, 2, 4, 1, 5, 6, 6, 6], OutList_).
    % deleteOneElement([1, 2, 1, 3, 1, 4], 1, OutList_).
    % deleteAllElement([1, 2, 1, 3, 1, 4], 1, OutList_).
    % oddPosList([1, 2, 3, 4, 5, 6], OutList_).
    % append([1, 2, 3], [4, 5, 6], OutList_).
    % listWithUpper([1, 2, 3, 4, 5, 6, 7, 8], 4, OutList_).