/* attack(senjata yang dipake, HP akhir enemy) --> mengattack enemy */
attack(Senjata) :-
    inventory(Senjata,_),
    enemy(_,_,_,HP),
    senjata(Senjata,AttSen,Jenis,Owner),
    HP1 is HP-AttSen,
    identitas(_,_,_,AttackP,_,_),
    B1 is HP1-AttackP,
    enemy(_,_,DefenseE,_),
    B is B1+DefenseE,
    retract(enemy(Musuh,Attack,Defense,_)),
    asserta(enemy(Musuh,Attack,Defense,B)).

attack(Senjata) :-
    \+inventory(Senjata,_),
    write('Tidak ada item tersebut di inventory anda').

specialattack(Senjata) :-
    inventory(Senjata,_),
    enemy(_,_,_,HP),
    senjata(Senjata,AttSen,Jenis,Owner),
    HP1 is HP-AttSen,
    identitas(_,_,_,AttackP,_,_),
    B1 is HP1-AttackP,
    B2 is B1*2
    enemy(_,_,DefenseE,_),
    B is B2+DefenseE,
    retract(enemy(Musuh,Attack,Defense,_)),
    asserta(enemy(Musuh,Attack,Defense,B)).

specialattack(Senjata) :-
    \+inventory(Senjata,_),
    write('Tidak ada item tersebut di inventory anda').