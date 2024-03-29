predicates
    maxOfTwo(real, real, real).
    maxOfTwoCut(real, real, real).
    maxOfThree(real, real, real, real).
    maxOfThreeCut(real, real, real, real).

clauses
    maxOfTwo(FVar, SVar, FVar) :- FVar >= SVar.
    maxOfTwo(FVar, SVar, SVar) :- FVar < SVar.

    maxOfTwoCut(FVar, SVar, FVar) :- FVar >= SVar, !.
    maxOfTwoCut(_, SVar, SVar).

    maxOfThree(FVar, SVar, TVar, FVar) :- FVar >= SVar, FVar >= TVar.
    maxOfThree(FVar, SVar, TVar, SVar) :- SVar >= FVar, SVar >= TVar.
    maxOfThree(FVar, SVar, TVar, TVar) :- TVar >= SVar, TVar >= FVar.

    maxOfThreeCut(FVar, SVar, TVar, FVar) :- FVar >= SVar, FVar >= TVar, !.
    maxOfThreeCut(_, SVar, TVar, SVar) :- SVar >= TVar, !.
    maxOfThreeCut(_, _, TVar, TVar).

goal
    maxOfTwo(1.2, 1.333, Max); % 1.333
    maxOfTwo(1.999, -2, Max); % 1.999
    maxOfTwo(1.999, 1.999, Max); % 1.999, 1.999

    maxOfTwoCut(1.2, 1.333, Max); % 1.333
    maxOfTwoCut(1.999, -2, Max); % 1.999
    maxOfTwoCut(1.999, 1.999, Max); % 1.999

    maxOfThree(1.1, 1.2, 1.3, Max); % 1.3
    maxOfThree(1.3, 1.2, 1.1, Max); % 1.3
    maxOfThree(1.3, 1.1, 1.2, Max); % 1.3
    maxOfThree(1.2, 1.1, 1.3, Max); % 1.3
    maxOfThree(1.2, 1.2, 1.3, Max); % 1.3
    maxOfThree(1.2, 1.3, 1.2, Max); % 1.3
    maxOfThree(1.3, 1.2, 1.2, Max); % 1.3
    maxOfThree(111, 111, 111, Max); % 111 111 111

    maxOfThreeCut(1.1, 1.2, 1.3, Max); % 1.3
    maxOfThreeCut(1.3, 1.2, 1.1, Max); % 1.3
    maxOfThreeCut(1.3, 1.1, 1.2, Max); % 1.3
    maxOfThreeCut(1.2, 1.1, 1.3, Max); % 1.3
    maxOfThreeCut(1.2, 1.2, 1.3, Max); % 1.3
    maxOfThreeCut(1.2, 1.3, 1.2, Max); % 1.3
    maxOfThreeCut(1.3, 1.2, 1.2, Max); % 1.3
    maxOfThreeCut(111, 111, 111, Max) % 111
    .