tree('Липа').
tree('Клён').
tree('Сосна').
tree('Тополь').
tree('Береза').
tree('Ель').

above('Липа', 'Клён').
above('Сосна', 'Тополь').

below('Береза', 'Тополь').
below('Сосна', 'Ель').
below('Липа', 'Береза').

higher(Tree) :-
    tree(Tree),
    not(above(_, Tree)),
    not(below(Tree, _)).

/*
higher(Tree) :-
    (   below(_, Tree)
    ;   above(Tree, _)
    ),
    not(above(_, Tree)),
    not(below(Tree, _)).
*/

smaller(Tree) :-
    tree(Tree),
    not(below(_, Tree)),
    not(above(Tree, _)).

/*
smaller(Tree):-
    (   below(Tree,_)
    ;   above(_,Tree)
    ),
    not(below(_, Tree)),
    not(above(Tree, _)).
*/