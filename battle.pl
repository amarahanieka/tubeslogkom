/* attack(senjata yang dipake, HP akhir enemy) --> mengattack enemy */
attack(Senjata) :-
    enemy(_,_,_,HP),
    senjata(Senjata,AttSen,Jenis,Owner),
    HP1 is HP-AttSen,
    identitas(_,_,_,AttackP,_,_),
    B1 is HP1-AttackP,
    enemy(_,_,DefenseE,_),
    B is B1+DefenseE,
    retract(enemy(Musuh,Attack,Defense,_)),
    asserta(enemy(Musuh,Attack,Defense,B)).

specialattack(Senjata) :-
    enemy(_,_,_,HP),
    senjata(Senjata,AttSen,Jenis,Owner),
    HP1 is HP-AttSen,
    identitas(_,_,_,AttackP,_,_),
    B1 is HP1-AttackP,
    enemy(_,_,DefenseE,_),
    B is B1+DefenseE,
    retract(enemy(Musuh,Attack,Defense,_)),
    asserta(enemy(Musuh,Attack,Defense,B)).