/* attack(senjata yang dipake, HP akhir enemy) --> mengattack enemy */
attack(Senjata,B) :-
    enemy(_,_,_,HP),
    senjata(Senjata,AttSen),
    HP1 is HP-AttSen,
    identitas(_,_,_,Attack,_,_),
    B1 is HP1-Attack,
    enemy(_,_,Defense,_),
    B is B1+Defense,
    retract(enemy(Musuh,Attack,Defense,_)),
    asserta(enemy(Musuh,Attack,Defense,B)).