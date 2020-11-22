job(swordsman).
job(archer).
job(sorcerer).

identitas(Job, )


/** status **/
status :-
    mulai(_),
    job(Job),
    write('Your status:'), nl,
    write('Job: '), write(Job), nl,
    write('Health: '), write(Job), nl,
    write('Attack: '), write(Job), nl,
    write('Defense: '), write(Job), nl,
    write('Exp: '), write(Job), nl,
    write('Gold: '), write(Job), nl.

status :-
    \+mulai(_),
    write('Anda harus berada di dalam game.').