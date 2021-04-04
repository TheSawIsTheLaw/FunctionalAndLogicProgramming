domains
    identificator = integer.
    firstName, lastName, university = string.

predicates
    identificatorOfStudent(identificator, firstName, lastName).
    studyIn(identificator, university).
    fromUniversity(university, identificator, firstName, lastName).

clauses
    identificatorOfStudent(1, "Sergey", "Kononenko").
    identificatorOfStudent(2, "Pavel", "Perestoronin").
    identificatorOfStudent(3, "Alexey", "Rabinovich").
    identificatorOfStudent(4, "Magerram", "Zeynalov").
    identificatorOfStudent(5, "Dmitry", "Yakuba").
    identificatorOfStudent(6, "Pavel", "Nahimov").

    studyIn(1, "BMSTU").
    studyIn(2, "BMSTU").
    studyIn(3, "BMSTU").
    studyIn(4, "MIREA").
    studyIn(5, "BMSTU").
    studyIn(2, "MSU").
    studyIn(4, "MIT").
    studyIn(2, "MIT").
    studyIn(6, "ITMO").

    fromUniversity(University, Identificator, FirstName, LastName) :- studyIn(Identificator, University),
    										 identificatorOfStudent(Identificator, FirstName, LastName).

goal
    % Get students' names
    identificatorOfStudent(1, FirstName, LastName); % FirstName=Sergey, LastName=Kononenko
    identificatorOfStudent(3, FirstName, LastName); % FirstName=Alexey, LastName=Rabinovich
    identificatorOfStudent(777, FirstName, LastName); % ---
    
    % Get students' identificators
    identificatorOfStudent(Id, "Pavel", LastName); % Id=2, LastName=Perestoronin; Id=6, LastName=Nahimov
    identificatorOfStudent(Id, "Magerram", "Zeynalov"); % Id = 4
    identificatorOfStudent(Id, "Unknown", "Unknown"); % ---
    
    % Get students from universities
    studyIn(Id, "BMSTU"); % Id=1 Id=2 Id=3 Id=5
    studyIn(4, University); % University=MIREA University=MIT
    studyIn(Id, "MSU"); % Id=2
    
    % Get students from university by rule
    fromUniversity("BMSTU", Id, FName, LName);
	% Id=1, FName=Sergey, LName=Kononenko
	% Id=2, FName=Pavel, LName=Perestoronin
	% Id=3, FName=Alexey, LName=Rabinovich
	% Id=5, FName=Dmitry, LName=Yakuba
    fromUniversity("MSU", Id, FName, LName);
	% Id=2, FName=Pavel, LName=Perestoronin
    fromUniversity("MIT", Id, FName, LName);
	% Id=4, FName=Magerram, LName=Zeynalov
	% Id=2, FName=Pavel, LName=Perestoronin
    
    % Get universities of student by rule
    fromUniversity(University, 3, FName, LName); % University=BMSTU, FName=Alexey, LName=Rabinovich
    fromUniversity(University, Id, "Pavel", LName);
    	% University=BMSTU, Id=2, LName=Perestoronin
	% University=MSU, Id=2, LName=Perestoronin
	% University=MIT, Id=2, LName=Perestoronin
	% University=ITMO, Id=6, LName=Nahimov
    fromUniversity(University, Id, "Magerram", "Zeynalov")
	% Id=4, FName=Magerram, LName=Zeynalov
	% Id=2, FName=Pavel, LName=Perestoronin
    .