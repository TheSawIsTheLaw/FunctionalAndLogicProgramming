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
    % SList - второй добавляемый список
    % AddTail - хвост списка, уходящий для собственного определения в глубину,
    % пока первый список не станет пустым (что станет и с AddTail)
    append([H|T], SList, [H|AddTail]) :-
                            append(T, SList, AddTail), % look for new value of AddTail
                            !.
    append([], SList, SList). % Just append last elements to a list

    % Num - число, больше которого должны быть элементы списка
    % AddTail - хвост, уходящий для собственного определения в глубину
    listWithUpper([H|T], Num, [H|AddTail]) :-
                                H > Num,
                                !,
                                listWithUpper(T, Num, AddTail).
    listWithUpper([_|T], Num, OutList) :- listWithUpper(T, Num, OutList), !.
    listWithUpper([], _, []).

    % OutList - см. AddTail предыдущих реализаций
    oddPosList([H|[_|T]], [H|OutList]) :-
                                oddPosList(T, OutList),
                                !.
    oddPosList(List, List).

    % El - элемент, подлежащий удалению
    % AddTail - см. предыдущие реализации
    deleteOneElement([H|T], El, [H|AddTail]) :-
                                El <> H,
                                !,
                                deleteOneElement(T, El, AddTail).
    deleteOneElement([H|T], H, T) :- !.
    deleteOneElement(List, _, List).

    % El - см. предыдущую реализацию
    % AddTail - см. предыдущую реализацию
    deleteAllElement([H|T], El, AddTail) :-
                                El = H,
                                !,
                                deleteAllElement(T, El, AddTail).
    deleteAllElement([H|T], El, [H|AddTail]) :- 
                                deleteAllElement(T, El, AddTail),
                                !.
    deleteAllElement(List, _, List).

    % El - элемент, включение которого требуется определить
    includes([_|T], El) :- 
                                includes(T, El),
                                !.
    includes([H|_], H).

    % AddTail - см. предыдущие реализации
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
    % listWithUpper([1, 4, 5], 4, OutList_).