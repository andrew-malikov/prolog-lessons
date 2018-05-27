:- use_module(lists, [listConcat/3]).

/* bubble sortion section */
/* swap first unorder items in list */
/* swap(List, Swapped) */
swap([X, Y|Xs], [Y, X|Xs]) :-
    X>Y, !.
swap([X|Xs], [X|Rs]) :-
    swap(Xs, Rs).

/* bubbleSort(List, Sorted)  */
bubbleSort(L, Sorted) :-
    swap(L, Swaped), !,
    bubbleSort(Swaped, Sorted).
bubbleSort(L, L).

/* insertion sort section */
/* insert item to sorted list */
/* insert(Item, List, Inserted) */
insert(Item, [X|Xs], [X|Inserted]) :-
    Item>X,
    insert(Item, Xs, Inserted), !.
insert(Item, L, [Item|L]).

/* insertionSort(List, Sorted) */
insertionSort([], []).
insertionSort([X|Xs], Sorted) :-
    insertionSort(Xs, Inserted),
    insert(X, Inserted, Sorted).

/* selection sorting section */
/* find min item in list */
/* minItem(List, MinItem) */
minItem([X], X) :- !.
minItem([X|Xs], X) :-
    minItem(Xs, Min),
    X=<Min,!.
minItem([_|Xs], Item) :-
    minItem(Xs, Item).

/* remove item from list only once */
/* removeItem(List, Item, Removed) */
removeItem([X|Xs], Item, [X|Removed]) :-
    x\=Item,
    removeItem(Xs, Item, Removed), !.
removeItem([X|Xs], X, Xs).

/* selectionSort(List, Sorted) */
selectionSort([], []).
selectionSort([X|Xs], [MinItem|Sorted]) :-
    minItem([X|Xs], MinItem),
    removeItem([X|Xs], MinItem, Removed),
    selectionSort(Removed, Sorted), !.

/* quick sorting section */
/* split list to two lists relative base item */
/* split(List, BaseItem, Smaller, Greater) */
split([], _, [], []).
split([X|Xs], SplitItem, [X|Smaller], Greater) :-
    X<SplitItem,!,
    split(Xs, SplitItem, Smaller, Greater).
split([X|Xs], SplitItem, Smaller, [X|Greater]) :-
    split(Xs, SplitItem, Smaller, Greater).

/* quickSort(List, Sorted) */
quickSort([],[]).
quickSort([X|Xs], Sorted) :-
    split(Xs, X, Smaller, Greater),
    quickSort(Smaller, LeftSorted),
    quickSort(Greater, RightSorted),
    listConcat(LeftSorted, [X|RightSorted], Sorted).

/* merge sorting section */
/* split(List, LeftList, RigthList) */
split([],[],[]).
split([X], [X], []).
split([X,Y|Xs], [X|Left], [Y|Right]) :-
    split(Xs, Left, Right),!.

/* merging sorted lists to one sorted list */
/* merge(FirstSortedList, SecondSortedList, Merged) */
merge(X,[],X).
merge([],Y,Y).
merge([X|Xs],[Y|Ys],[X|Merged]) :-  
    X =< Y, !,
    merge(Xs,[Y|Ys],Merged).
merge([X|Xs],[Y|Ys],[Y|Merged]) :-
    merge([X|Xs],Ys,Merged).

/* mergeSort(List, Sorted) */
mergeSort([],[]):-!.
mergeSort([X],[X]):-!.
mergeSort(X, Sorted):-
    split(X, Left, Right),
    mergeSort(Left, SortedLeft),
    mergeSort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Sorted),!.
