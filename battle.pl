/* attack(senjata yang dipake, HP akhir enemy) --> mengattack enemy */
attack(A,B) :-
    enemy(_,_,_,X),
    senjata(A,A1),
    Z1 is X-A1,
    identitas(_,_,_,W,_,_),
    B1 is Z1-W,
    enemy(_,_,Y,_),
    B is B1+Y,
    enemy(_,_,_,B). 
    /* masih ngeluarin false */