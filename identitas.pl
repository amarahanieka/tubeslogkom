job(swordsman).
job(archer).
job(sorcerer).

/** identitas(Job, Level, Attack, Defense, MaxHP) **/
identitas(Job, 1, 10, 5, 100).

/** status **/
status :-
    mulai(_),
    job(Job),
    identitas(Job, Level, Attack, Defense, MaxHP),
    write('                              _        _             '), nl,
    write(' _   _  ___  _   _ _ __   ___| |_ __ _| |_ _   _ ___ '), nl,
    write('| | | |/ _ \\| | | | \'__| / __| __/ _` | __| | | / __|'), nl,
    write('| |_| | (_) | |_| | |    \\__ \\ || (_| | |_| |_| \\__ \\'), nl,
    write(' \\__, |\\___/ \\__,_|_|    |___/\\__\\__,_|\\__|\\__,_|___/'), nl,
    write(' |___/   '), nl, nl,
    write('Job: '), write(Job), nl,
    write('Level: '), write(Level), nl,
    write('Attack: '), write(Attack), nl,
    write('Defense: '), write(Defense), nl,
    write('Max HP: '), write(MaxHP), nl.

status :-
    \+mulai(_), nl,
    write('Anda harus berada di dalam game.').