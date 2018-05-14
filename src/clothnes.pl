name('Аня').
name('Валя').
name('Наташа').

color('Белый').
color('Зеленый').
color('Синий').

shoesColor(Name, Color) :-
    name(Name),
    color(Color),
    Name=='Аня'.
    
shoesColor(Name, Color) :-
    name(Name),
    color(Color),
    Name=='Валя',
    Color\=='Белый'.
    
shoesColor(Name, Color) :-
    name(Name),
    color(Color),
    Name=='Наташа',
    Color=='Зеленый'.

dressColor(Name, Color) :-
    name(Name),
    color(Color),
    Name=='Аня'.

dressColor(Name, Color) :-
    name(Name),
    color(Color),
    Name=='Валя',
    Color\=='Белый'.

dressColor(Name, Color) :-
    name(Name),
    color(Color),
    Name=='Наташа'.
    
clothesColor(Name, ShoesColor, DressColor) :-
    name(Name),
    shoesColor(Name, ShoesColor),
    dressColor(Name, DressColor),
    Name=='Валя',
    ShoesColor\==DressColor,
    shoesColor('Наташа', OtherShoesColor),
    OtherShoesColor\==ShoesColor.

clothesColor(Name, ShoesColor, DressColor) :-
    name(Name),
    shoesColor(Name, ShoesColor),
    dressColor(Name, DressColor),
    Name=='Аня',
    ShoesColor==DressColor,
    clothesColor('Валя', OtherShoesColor, OtherDressColor),
    ShoesColor\==OtherShoesColor,
    DressColor\==OtherDressColor.

clothesColor(Name, ShoesColor, DressColor) :-
    name(Name),
    shoesColor(Name, ShoesColor),
    dressColor(Name, DressColor),
    Name=='Наташа',
    ShoesColor\==DressColor,
    clothesColor('Аня', _, OtherDressColor),
    DressColor\==OtherDressColor.
