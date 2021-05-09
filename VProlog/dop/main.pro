domains
    list = integer*.
    % Phonebook
    lastName, telephoneNum = string.
    city, street, houseNum = string.
    flatNum = integer.
    address = address(city, street, houseNum, flatNum).

    % cars and wTransport
    carBrand, color = string.
    price = real.

    % bank's depositors
    bankName = string.
    depositId = integer.
    depositSum = real.

    % ownerships
    size = integer.
    ownership = 
                building(price, address);
                area(price, size);
                waterTransport(price, color);
                car(price, carBrand, color).

predicates
    hasPhone(lastName, telephoneNum, address).
    hasDeposit(lastName, bankName, depositId, depositSum).

    own(lastName, ownership).

    findSumDeposit(lastName, real).
    findSumInner(lastName, list, real).

    listSum(list, integer).
    listSumInner(list, integer, integer).

    notIncludes(list, integer).

    findListOfDeposits(string, list)
    findListOfDepositsInner(string, list, list).

clauses
    hasPhone("Perestoronin", "+79991112233", address("Moscow", "Golubinskaya", "28/77", 333)).
    hasPhone("Yakuba", "+79161586666", address("Whitechapel", "Bitsevky Lesopark", "derevo 1", 1)).
    hasPhone("Yakuba", "+66666666666", address("Whitechapel", "Diggs Road", "7", 666)).
    hasPhone("Kovalev", "+79993332211", address("Moscow", "Lusinovskaya", "12/2", 12)).
    hasPhone("Kovalev", "+37773892047", address("Moscow", "Paveletsky Proezd", "1", 326)).
    hasPhone("KovalevA", "+00000000000", address("Moscow", "Paveletsky Proezd", "1", 326)).
    
    own("Perestoronin", building(333333, address("Moscow", "Golubinskaya", "28/77", 333))).
    own("Perestoronin", car(500000, "Daewoo", "Silver")).
    
    own("Yakuba", car(900000, "Volkswagen", "Yellow-Silver")).

    own("KovalevA", area(5000000, 500)).
    own("KovalevA", car(2200000, "Volvo", "Dark Blue")).

    own("Kovalev", car(2200000, "Volvo", "Dark Blue")).
    own("Kovalev", waterTransport(5000000, "Gold")).
    own("Kovalev", building(500000000, address("Moscow", "Lusinovskaya", "12/2", 12))).
    own("Kovalev", area(7777777, 777)).
    
    hasDeposit("Perestoronin", "Switzerland Bank", 111111, 1000000).
    hasDeposit("Perestoronin", "Bokmal Bank", 000001, 999999.23).
    hasDeposit("Yakuba" ,"Sektor Gaza Bank", 666666, 300).
    hasDeposit("Kovalev", "Sberbank", 123456, 123456789).
    hasDeposit("KovalevA", "Tinkoff", 531, 97531).
    hasDeposit("Kovalev", "Not Sberbank", 654321, 987654321).

    findListOfDepositsInner(LastName, Tail, Answ) :-
                            hasDeposit(LastName, _, _, DepSum),
                            notIncludes(Tail, DepSum),
                            !,
                            findListOfDepositsInner(LastName, [DepSum|Tail], Answ).
    
    findListOfDepositsInner(_, Tail, Answ) :- Answ = Tail.

    findListOfDeposits(LastName, Answ) :- findListOfDepositsInner(LastName, [], Answ).

    findSumInner(LastName, Tail, Sum) :-
                            hasDeposit(LastName, _, _, DepSum),
                            notIncludes(Tail, DepSum),
                            !,
                            findSumInner(LastName, [DepSum|Tail], Sum).
    
    findSumInner(_, Tail, Sum) :-
                            listSum(Tail, Sum).

    notIncludes([H|_], H) :- !, fail.
    notIncludes([_|T], El) :- 
                                notIncludes(T, El),
                                !.
    notIncludes([], _).

    listSumInner([H|T], OutAnswer, CurAnswer) :-
                                    TempAnswer = CurAnswer + H,
                                    listSumInner(T, OutAnswer, TempAnswer).
    listSumInner([], OutAnswer, CurAnswer) :- OutAnswer = CurAnswer.
    
    listSum(List, Answ) :- listSumInner(List, Answ, 0).

    findSumDeposit(LastName, Sum) :- findListOfDeposits(LastName, List), listSum(List, Sum).

goal
    findSumDeposit("Kovalev", Answ).
    