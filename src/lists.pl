listLength([], 0).
listLength([_|Xs], L) :-
    listLength(Xs, N),
    L is N+1.

listContain([X|_], X) :- !.
listContain([_|Xs], Item) :-
    listContain(Xs, Item), !.
listContain([X|_], Item) :-
    is_list(X),
    listContain(X, Item).

listConcat([], List, List).
listConcat([X|Xs], L2, [X|L3]) :-
    listConcat(Xs, L2, L3).

listRecursiveReverse([], []).
listRecursiveReverse([X|Xs], Reverse) :-
    is_list(X),
    listRecursiveReverse(X, Rx),
    listRecursiveReverse(Xs, NewReverse),
    listConcat(NewReverse, [Rx], Reverse), !.
listRecursiveReverse([X|Xs], Reverse) :-
    not(is_list(X)),
    listRecursiveReverse(Xs, NewReverse),
    listConcat(NewReverse, [X], Reverse).

listReverse([], []).
listReverse([X|Xs], Reverse) :-
    listReverse(Xs, NewReverse),
    listConcat(NewReverse, [X], Reverse).

/*
isPalindromeList(List) :-
    listReverse(List, ReversedList),
    isPalindromeList(List, ReversedList).

isPalindromeList([], _).
isPalindromeList([X|Xs], [X|Rs]) :-
    isPalindromeList(Xs, Rs).
*/
isPolindrome(List) :-
    listReverse(List, List).

listTake([], _, _) :-
    false.
listTake([X|_], 0, X) :- !.
listTake([_|Xs], Number, Item) :-
    NewNumber is Number-1,
    listTake(Xs, NewNumber, Item).

listRemove([], _, []).
listRemove([X|Xs], Item, [X|List]) :-
    X\==Item,
    not(is_list(X)),
    listRemove(Xs, Item, List), !.
listRemove([X|Xs], Item, [NewList|List]) :-
    X\==Item,
    is_list(X),
    listRemove(X, Item, NewList),
    listRemove(Xs, Item, List). 
listRemove([X|Xs], X, List) :-
    listRemove(Xs, X, List), !.
