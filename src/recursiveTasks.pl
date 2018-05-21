sum(1, 1) :- !.
sum(Number, Result) :-
    NewNumber is Number-1,
    sum(NewNumber, NewResult),
    Result is NewResult+Number.

oddSum(1, 1) :- !.
oddSum(Number, Result) :-
    NewNumber is Number-2,
    oddSum(NewNumber, NewResult),
    Result is NewResult+Number.

evenOrOddSum(0, 0) :- !.
evenOrOddSum(1, 1) :- !.
evenOrOddSum(Number, Result) :-
    NewNumber is Number-2,
    evenOrOddSum(NewNumber, NewResult),
    Result is NewResult+Number.

factorial(0, 1) :- !.
factorial(1, 1) :- !.
factorial(Number, Result) :-
    NewNumber is Number-1,
    factorial(NewNumber, NewResult),
    Result is NewResult*Number.