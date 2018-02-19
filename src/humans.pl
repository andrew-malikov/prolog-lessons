woman('Мери').

man('Джон').

/* property(Name, Property) */
property('Мери', прелестна).
property('Джон', добрый).
property('Джон', мужественный).
property('Джон', сильный).

manLikes(Man, Woman) :-
    man(Man),
    woman(Woman),
    property(Woman, прелестна).

womanLikes(Woman, Man) :-
    manLikes(Man, Woman),
    (   property(Man, богатый)
    ;   property(Man, добрый),
        property(Man, сильный)
    ).

happy(SomeBody) :-
    (   property(SomeBody, богатый)
    ;   womanLikes(_, SomeBody)
    ).

/* Queries

?- happy('Джон').

?- manLikes(Man, Woman).

*/