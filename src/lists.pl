listLength([], 0).
listLength([_|Xs], L) :-
    listLength(Xs, N),
    L is N+1.

listContain([], _) :-
    false.
listContain([X|_], Item):-
    is_list(X),
    listContain(X, Item),!.
listContain([X|Xs], Item) :-
    X==Item;
    listContain(Xs, Item).

listConcat([], List, List).
listConcat([X|Xs], L2, [X|L3]) :-
    listConcat(Xs, L2, L3).

/* TODO: append item to end of list */
/*
listReverse([], []).
listReverse([X|Xs], Reverse) :-
    listReverse(Xs, Reverse),
    listConcat(Reverse,X,L3).

listPalindrome([]).
*/

listTake([], _, _).
listTake([X|_], 0, X).
listTake([_|Xs], Number, Item) :-
    NewNumber is Number-1,
    listTake(Xs, NewNumber, Item),!.

listRemove([], _, []).
listRemove([X|Xs], Item, [X|List]) :-
    X\==Item,
    listRemove(Xs, Item, List).
listRemove([X|Xs], Item, List) :-
    X==Item,
    listRemove(Xs, Item, List).
