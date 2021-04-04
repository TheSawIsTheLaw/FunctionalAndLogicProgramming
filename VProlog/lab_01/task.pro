predicates
	usesNumber(string, string).
	
clauses
	usesNumber("Pavel Perestoronin", "+79132249931").
	usesNumber("Ukunsun Vladimirovich", "+79996663322").
	usesNumber("No Name", "Unknown").
	usesNumber("Giopika Vladislavovich", "+71581588").
	usesNumber("Somebody once told him", "Unknown").
	usesNumber("Alis Sukocheva", Number) :-usesNumber("Pavel Perestoronin", Number).

goal
	usesNumber("Alis Sukocheva", Number); % Number=+79132249931
	usesNumber("Giopika Vladislavovich", Number); % Number=+71581588
	usesNumber(LastName, "+79996663322"); % LastName=Ukunsun Vladimirovich
	usesNumber(LastName, "+79132249931");
	% LastName=Pavel Perestoronin
	% LastName=Alis Sukocheva
	usesNumber(LastName, "777"); % No solution
	usesNumber("Giopika 000", _) % No
	.