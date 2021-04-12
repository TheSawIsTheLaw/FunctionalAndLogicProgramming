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
    hasCar(lastName, city, carBrand, carColor, carPrice).
    hasDeposit(lastName, city, bankName, depositId, depositSum).

    getNCTDbyCarBrandColor(carBrand, carColor, lastName, city, telephoneNum, bankName).

clauses
    hasPhone("Perestoronin", "+79991112233", address("Moscow", "Golubinskaya", "28/77", 333)).
    hasPhone("Yakuba", "+79161586666", address("Whitechapel", "Bitsevky Lesopark", "derevo 1", 1)).
    hasPhone("Yakuba", "+66666666666", address("Whitechapel", "Diggs Road", "7", 666)).
    hasPhone("Kovalev", "+79993332211", address("Moscow", "Lusinovskaya", "12/2", 12)).
    hasPhone("Kovalev", "+37773892047", address("Moscow", "Paveletsky Proezd", "1", 326)).
    hasPhone("KovalevA", "+00000000000", address("Moscow", "Paveletsky Proezd", "1", 326)).
    hasPhone("Kovalev", "+11111111111", address("Nijnii Novgorod", "Not Lusinovskaya", "2/12", 88)).
    hasPhone("Kovalev", "+22222222222", address("Nijnii Novgorod", "Not Paveletsky Proezd", "-1", 22)).
    
    
    hasCar("Perestoronin", "Moscow", "Daewoo", "Silver", 500000).
    hasCar("Yakuba", "Whitechapel", "Volkswagen", "Yellow-Silver", 900000).
    hasCar("Kovalev", "Moscow", "Volvo", "Dark Blue", 2200000).
    hasCar("KovalevA", "Moscow", "Volvo", "Dark Blue", 2200000).
    hasCar("Kovalev", "Moscow", "Mercedes", "Light crema", 3000000).
    hasCar("Kovalev", "Nijnii Novgorod", "KIA", "Pink", 2200000).
    
    hasDeposit("Perestoronin", "Moscow", "Switzerland Bank", 111111, 1000000).
    hasDeposit("Perestoronin", "Moscow", "Bokmal Bank", 000001, 999999.23).
    hasDeposit("Yakuba", "Whitechapel" ,"Sektor Gaza Bank", 666666, 300).
    hasDeposit("Kovalev", "Moscow", "Sberbank", 123456, 123456789).
    hasDeposit("KovalevA", "Moscow", "Tinkoff", 531, 97531).
    hasDeposit("Kovalev", "Nijnii Novgorod", "Not Sberbank", 654321, 987654321).

    getNCTDbyCarBrandColor(CarBrand_, CarColor_, LName_, City_, Telephone_, Bank_) :- 
                                        hasCar(LName_, City_, CarBrand_, CarColor_, _), 
                                        hasPhone(LName_, Telephone_, address(City_, _, _, _)),
                                        hasDeposit(LName_, City_, Bank_, _, _).

goal
    getNCTDbyCarBrandColor("Volvo", "Dark Blue", LName, City, Telephone, Bank).