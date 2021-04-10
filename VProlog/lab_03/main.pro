domains
    % Phonebook
    lastName, telephoneNum = string.
    city, street, houseNum = string.
    flatNum = integer.
    address = address(city, street, houseNum, flatNum).

    % cars
    carBrand, carColor = string.
    carPrice = real.

    % bank's depositors
    bankName = string.
    depositId = integer.
    depositSum = real.

predicates
    hasPhone(lastName, telephoneNum, address).
    hasCar(lastName, carBrand, carColor, carPrice).
    hasDeposit(lastName, city, bankName, depositId, depositSum). % For second ex we have city

    hasCarByPhoneBook(telephoneNum, lastName, carBrand, carPrice).
    hasDepositByLastNameCity(lastName, city, street, bankName, telephoneNum).

clauses
    hasPhone("Perestoronin", "+79991112233", address("Moscow", "Golubinskaya", "28/77", 333)).
    hasPhone("Yakuba", "+79161586666", address("Whitechapel", "Bitsevky Lesopark", "derevo 1", 1)).
    hasPhone("Yakuba", "+66666666666", address("Whitechapel", "Diggs Road", "7", 666)).
    hasPhone("Kovalev", "+79993332211", address("Moscow", "Lusinovskaya", "12/2", 12)).
    hasPhone("Kovalev", "+37773892047", address("Moscow", "Paveletsky Proezd", "1", 326)).
    hasPhone("Kovalev", "+11111111111", address("Nijnii Novgorod", "Not Lusinovskaya", "2/12", 88)).
    hasPhone("Kovalev", "+22222222222", address("Nijnii Novgorod", "Not Paveletsky Proezd", "-1", 22)).
    
    
    hasCar("Perestoronin", "Daewoo", "Silver", 500000).
    hasCar("Yakuba", "Volkswagen", "Yellow-Silver", 900000).
    hasCar("Kovalev", "Volvo", "Dark Blue", 2200000).
    hasCar("Kovalev", "Mercedes", "Light crema", 3000000).
    hasCar("Kovalev", "KIA", "Pink", 2200000).
    
    hasDeposit("Perestoronin", "Moscow", "Switzerland Bank", 111111, 1000000).
    hasDeposit("Perestoronin", "Moscow", "Bokmal Bank", 000001, 999999.23).
    hasDeposit("Yakuba", "Whitechapel" ,"Sektor Gaza Bank", 666666, 300).
    hasDeposit("Kovalev", "Moscow", "Sberbank", 123456, 123456789).
    hasDeposit("Kovalev", "Nijnii Novgorod", "Not Sberbank", 654321, 987654321).

    hasCarByPhoneBook(Telephone_, LName_, CarBrand_, CarPrice_) :- hasCar(LName_, CarBrand_, _, CarPrice_), 
                                                            hasPhone(LName_, Telephone_, _).

    hasDepositByLastNameCity(LastName_, City_, Street_, Bank_, Telephone_) :- hasDeposit(LastName_, City_, Bank_, _, _),
                                                                         hasPhone(LastName_, Telephone_, address(City_, Street_, _, _)).

goal
    % get car by phone book
    hasCarByPhoneBook("+79993332211", LName, CarBrand, CarPrice);
        % LName=Kovalev, CarBrand=Volvo, CarPrice=2200000
        % LName=Kovalev, CarBrand=Mercedes, CarPrice=3000000
        % LName=Kovalev, CarBrand=KIA, CarPrice=2200000
    hasCarByPhoneBook("+66666666666", LName, CarBrand, CarPrice);
        % LName=Yakuba, CarBrand=Volkswagen, CarPrice=900000
    hasCarByPhoneBook("+79161586666", LName, CarBrand, CarPrice);
        % LName=Yakuba, CarBrand=Volkswagen, CarPrice=900000
    hasCarByPhoneBook("+79991112233", LName, CarBrand, CarPrice);
        % LName=Perestoronin, CarBrand=Daewoo, CarPrice=500000
    
    % get only car brand using last one
    hasCarByPhoneBook("+79993332211", _, CarBrand, _);
        % CarBrand=Volvo
        % CarBrand=Mercedes
        % CarBrand=KIA
    hasCarByPhoneBook("+66666666666", _, CarBrand, _);
        % CarBrand=Volkswagen
    hasCarByPhoneBook("+79161586666", _, CarBrand, _);
        % CarBrand=Volkswagen
    hasCarByPhoneBook("+79991112233", _, CarBrand, _);
        % CarBrand=Daewoo

    % get address, banks and telephone
    hasDepositByLastNameCity("Kovalev", "Moscow", Street, Bank, Telephone);
    	% Street=Lusinovskaya, Bank=Sberbank, Telephone=+79993332211
	% Street=Paveletsky Proezd, Bank=Sberbank, Telephone=+37773892047
	
    hasDepositByLastNameCity("Kovalev", "Nijnii Novgorod", Street, Bank, Telephone);
        % Street=Not Lusinovskaya, Bank=Not Sberbank, Telephone=+11111111111
        % Street=Not Paveletsky Proezd, Bank=Not Sberbank, Telephone=+22222222222

    hasDepositByLastNameCity("Perestoronin", "Moscow", Street, Bank, Telephone);
        % Street=Golubinskaya, Bank=Switzerland Bank, Telephone=+79991112233
        % Street=Golubinskaya, Bank=Bokmal Bank, Telephone=+79991112233

    hasDepositByLastNameCity("Yakuba", "Whitechapel", Street, Bank, Telephone)
        % Street=Bitsevky Lesopark, Bank=Sektor Gaza Bank, Telephone=+79161586666
        % Street=Diggs Road, Bank=Sektor Gaza Bank, Telephone=+66666666666
    .