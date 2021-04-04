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
	usesNumber("Alis Sukocheva", _).