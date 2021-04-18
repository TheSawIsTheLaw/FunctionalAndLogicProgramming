domains
    sex = symbol.
    name = string.
    parent = parent(name, sex).

predicates
    isParentOf(parent, name).
    ancestors(name, name, name, name, name).

clauses
    isParentOf(parent("Alexey Romanov", m), "Morgan Romanov").
    isParentOf(parent("Alexandra Romanova", w), "Morgan Romanov").
    
    isParentOf(parent("Helen Romanova", w), "Alexey Romanov").
    isParentOf(parent("Vasiliy Romanov", m), "Alexey Romanov").

    isParentOf(parent("Klavdiya Portak", w), "Helen Romanova").
    isParentOf(parent("Evheny Portak", m), "Helen Romanova").

    isParentOf(parent("Valentina Romanova", w), "Vasiliy Romanov").
    isParentOf(parent("Elisey Romanov", m), "Vasiliy Romanov").

    isParentOf(parent("Anastasia Grishkovec", w), "Alexandra Romanova").
    isParentOf(parent("Gennadiy Sehenswurdigkeiten", m), "Alexandra Romanova").

    isParentOf(parent("Irina Grishkovec", w), "Anastasia Grishkovec").
    isParentOf(parent("Sergey Grishkovec", m), "Anastasia Grishkovec").

    isParentOf(parent("Klavdiya Sehenswurdigkeiten", w), "Gennadiy Sehenswurdigkeiten").
    isParentOf(parent("Dmitry Sehenswurdigkeiten", m), "Gennadiy Sehenswurdigkeiten").

    ancestors(ChildName, MothersMother, MothersFather, FathersMother, FathersFather) :-
        isParentOf(parent(MothersName, w), ChildName), isParentOf(parent(FathersName, m), ChildName),
        isParentOf(parent(MothersMother, w), MothersName), isParentOf(parent(MothersFather, m), MothersName),
        isParentOf(parent(FathersMother, w), FathersName), isParentOf(parent(FathersFather, m), FathersName).

goal
    % ancestors("Morgan Romanov", MothersMotherName, _, FathersMotherName, _)
    % Point 1
    % MothersMotherName=Anastasia Grishkovec,
    % FathersMotherName=Helen Romanova
    
    % ancestors("Morgan Romanov", _, MothersFatherName, _, FathersFatherName)
    % Point 2
    % MothersFatherName=Gennadiy Sehenswurdigkeiten,
    % FathersFatherName=Vasiliy Romanov
    
    % ancestors("Alexey Romanov", MothersMotherName, MothersFatherName, FathersMotherName, FathersFatherName)
    % Point 3
    % MothersMotherName=Klavdiya Portak, 
    % MothersFatherName=Evheny Portak, 
    % FathersMotherName=Valentina Romanova, 
    % FathersFatherName=Elisey Romanov
    
    ancestors("Alexey Romanov", MothersMotherName, _, _, _)
    % Point 4
    % MothersMotherName=Klavdiya Portak
    
    % ancestors("Alexandra Romanova", MothersMotherName, MothersFatherName, _, _)
    % Point 5
    % MothersMotherName=Irina Grishkovec,
    % MothersFatherName=Sergey Grishkovec
    .