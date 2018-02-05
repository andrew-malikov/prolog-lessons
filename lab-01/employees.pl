job('Stive', 'Product Designer').
job('Laky', 'Junior Web Designer').
job('Olly', 'Web Designer').
job('Morgan', 'Design Lead').
job('John', 'NodeJS Developer').
job('Oleg', 'NodeJS Developer').
job('Klaus', 'Architect').
job('Arnold', 'Database Developer').
job('Percival', 'Frontend Developer').
job('Matthias','Frontend Developer').
job('Leo','Backend Lead').
job('Viliam','Frontend Lead').

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
workQuality('Leo', 6.7).
workQuality('Viliam', 5.5).

employee('Stive', 'Morgan').
employee('Laky', 'Olly').
employee('Olly', 'Morgan').
employee('John', 'Leo').
employee('Oleg', 'Leo').
employee('Arnold', 'Leo').
employee('Percival', 'Viliam').
employee('Matthias', 'Viliam').

employer(Employer, Employee) :- employee(Employee, Employer).
