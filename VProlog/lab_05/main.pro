domains
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
    ownObjects(lastName, symbol).
    hasOwnershipNamePrice(lastName, symbol, price).
    ownObjectsInner(lastName, symbol, price).
    ownObjectsPrice(lastName, price).

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

    % 1
    ownObjects(LastName_, building) :- own(LastName_, building(_, _)).
    ownObjects(LastName_, area) :- own(LastName_, area(_, _)).
    ownObjects(LastName_, waterTransport) :- own(LastName_, waterTransport(_, _)).
    ownObjects(LastName_, car) :- own(LastName_, car(_, _, _)).

    % 2
    hasOwnershipNamePrice(LastName_, building, Price_) :- own(LastName_, building(Price_, _)).
    hasOwnershipNamePrice(LastName_, area, Price_) :- own(LastName_, area(Price_, _)).
    hasOwnershipNamePrice(LastName_, waterTransport, Price_) :- own(LastName_, waterTransport(Price_, _)).
    hasOwnershipNamePrice(LastName_, car, Price_) :- own(LastName_, car(Price_, _, _)).
    
    % 3
    ownObjectsInner(LastName_, building, Price_) :- own(LastName_, building(Price_, _)), !.
    ownObjectsInner(LastName_, area, Price_) :- own(LastName_, area(Price_, _)), !.
    ownObjectsInner(LastName_, waterTransport, Price_) :- own(LastName_, waterTransport(Price_, _)), !.
    ownObjectsInner(LastName_, car, Price_) :- own(LastName_, car(Price_, _, _)), !.
    ownObjectsInner(_, _, 0).
    
    ownObjectsPrice(LastName_, Price_) :-
                        ownObjectsInner(LastName_, building, FPrice),
                        ownObjectsInner(LastName_, area, SPrice),
                        ownObjectsInner(LastName_, waterTransport, TPrice),
                        ownObjectsInner(LastName_, car, FoPrice),
                        Price_ = FPrice + SPrice + TPrice + FoPrice.

goal
    %ownObjects("Perestoronin", Object).
    %hasOwnershipNamePrice("KovalevA", Object, Price).
    ownObjectsPrice("Perestoronin", Price).