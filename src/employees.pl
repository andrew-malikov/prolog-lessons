/* job(Name, Position, Department) */
job('Stive', 'Product Designer', 'Design').
job('Laky', 'Junior Web Designer', 'Design').
job('Olly', 'Web Designer', 'Design').
job('Morgan', 'Teamlead', 'Design').
job('John', 'NodeJS Developer', 'Development').
job('Oleg', 'NodeJS Developer', 'Development').
job('Klaus', 'Architect', 'Development').
job('Arnold', 'Database Developer', 'Development').
job('Percival', 'Frontend Developer', 'Development').
job('Matthias', 'Frontend Developer', 'Development').
job('Viliam', 'Teamlead', 'Development').
job('Nikolas', 'Director', 'Management').

/* workQuality(Name, Points) */
workQuality('Stive', 7.2).
workQuality('Laky', 4.1).
workQuality('Olly', 8.4).
workQuality('Morgan', 6.8).
workQuality('John', 5.6).
workQuality('Oleg', 9.5).
workQuality('Klaus', 8.6).
workQuality('Arnold', 4.7).
workQuality('Percival', 7.3).
workQuality('Matthias', 7.8).
workQuality('Viliam', 9.5).
workQuality('Nikolas', 8.6).

/* employee(Employee, Employer) */
employee('Stive', 'Morgan').
employee('Laky', 'Olly').
employee('Olly', 'Morgan').
employee('John', 'Viliam').
employee('Oleg', 'Viliam').
employee('Arnold', 'Viliam').
employee('Percival', 'Viliam').
employee('Matthias', 'Viliam').
employee('Morgan', 'Nikolas').
employee('Klaus', 'Viliam').
employee('Viliam', 'Nikolas').

employer(Employer, Employee) :-
    employee(Employee, Employer).

award(Name) :-
    workQuality(Name, Points),
    Points>=8.5.

colleagues(Name1, Name2) :-
    job(Name1, _, Department),
    job(Name2, _, Department),
    Name1 \== Name2. 

departmentAward(Department) :-
    job(N, _, Department),
    award(N).

/*

?- job(Name, 'Director', _), employer(Name, X).

?- employer(E, W), award(E), award(W), job(E, S, _).

?- job(N, _, D), award(N).

?- job(W, _, WD), employer(E, W), job(E, _, ED), WD \== ED.

?- job(N1, P, _), job(N2, P, _), N1 \== N2.

?- employer(E, W), (award(E) ; award(W)).

?- employer(E, W), award(E), not(award(W)).

?- colleagues(N1, N2), award(N1), not(award(N2)).

?- job(N1, P, D1), job(N2, P, D2), D1 \== D2, N1 \== N2.

?- employer(E, _), not(employer(_, E)).

*/