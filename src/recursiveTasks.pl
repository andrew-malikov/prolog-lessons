sum(1, 1) :- !.
sum(Number, Reduce) :-
    NewNumber is Number-1,
    sum(NewNumber, NewReduce),
    Reduce is NewReduce+Number.

oddSum(1, 1) :- !.
oddSum(Number, Reduce) :-
    NewNumber is Number-2,
    oddSum(NewNumber, NewReduce),
    Reduce is NewReduce+Number.


evenOrOddSum(0, 0) :- !.
evenOrOddSum(1, 1) :- !.
evenOrOddSum(Number, Reduce) :-
    NewNumber is Number-2,
    evenOrOddSum(NewNumber, NewReduce),
    Reduce is NewReduce+Number.

factorial(0, 1) :- !.
factorial(1, 1) :- !.
factorial(Number, Reduce) :-
    NewNumber is Number-1,
    factorial(NewNumber, NewReduce),
    Reduce is NewReduce*Number.