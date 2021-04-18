domains
    sex = symbol.
    name = string.
    parent = parent(name, sex).

predicates
    isParentOf(parent, name).
    ancestors(name, name, name, name, name).

clauses
    isParentOf(parent("Alexey Romanov", m), "Morgan Romanov").
    isParentOf(parent("Alexey Romanov", m), "Philip Romanov").
    isParentOf(parent("Alexandra Romanova", w), "Morgan Romanov").
    
    isParentOf(parent("Helen Romanova", w), "Alexey Romanov").
    isParentOf(parent("Vasiliy Romanov", m), "Alexey Romanov").

    isParentOf(parent("Klavdiya Portak", w), "Helen Romanova").
    isParentOf(parent("Evheny Portak", m), "Helen Romanova").

    isParentOf(parent("Valentina Romanova", w), "Vasiliy Romanov").
    isParentOf(parent("Elisey Romanov", m), "Vasiliy Romanov").

    isParentOf(parent("Anastasia Grishkovec", w), "Alexandra Romanova").
    isParentOf(parent("Gennadiy Sehenswürdigkeiten", m), "Alexandra Romanova").

    isParentOf(parent("Irina Grishkovec", w), "Anastasia Grishkovec").
    isParentOf(parent("Dmitry Grishkovec", m), "Anastasia Grishkovec").

    isParentOf(parent("Klavdiya Sehenswürdigkeiten", w), "Gennadiy Sehenswürdigkeiten").
    isParentOf(parent("Dmitry Sehenswürdigkeiten", m), "Gennadiy Sehenswürdigkeiten").

    ancestors(ChildName, MothersMother, MothersFather, FathersMother, FathersFather) :-
        isParentOf(parent(MothersName, w), ChildName), isParentOf(parent(FathersName, m), ChildName),
        isParentOf(parent(MothersMother, w), MothersName), isParentOf(parent(MothersFather, m), MothersName),
        isParentOf(parent(FathersMother, w), FathersName), isParentOf(parent(FathersFather, m), FathersName).

goal
    ancestors("Alexey Romanov", MothersMotherName, MothersFatherName, FathersMotherName, FathersFatherName).