swap([X, Y|Xs], [Y, X|Xs]) :-
    X>Y, !.
swap([X|Xs], [X|Rs]) :-
    swap(Xs, Rs).

bubble(L, Sorted) :-
    swap(L, Swaped), !,
    bubble(Swaped, Sorted).
bubble(L, L).

/*
insert(Item, [], [Item]) :- !.
insert(Item, [X|Xs], [X|Inserted]) :-
    Item>X,
    insert(Item, Xs, Inserted), !.
insert(Item, [X|Xs], [Item, X|Xs]) :-
    Item=<X.
*/

insert(Item, [X|Xs], [X|Inserted]) :-
    Item>X,
    insert(Item, Xs, Inserted), !.
insert(Item, L, [Item|L]).

insertion([], []).
insertion([X|Xs], Sorted) :-
    insertion(Xs, Inserted),
    insert(X, Inserted, Sorted).
