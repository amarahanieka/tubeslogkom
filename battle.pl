:- dynamic enemy/4.
:- dynamic identitas/7.

/* attack(senjata yang dipake, HP akhir enemy) --> mengattack enemy */
attack(Senjata) :-
    /* attack ke musuh */
    iniinventory(Senjata,_),
    enemy(_,AttackE,DefenseE,HPE),
    senjata(Senjata,AttackSen,Jenis,Owner),
    HPE1 is HPE-AttackSen,
    identitas(_,_,AttackP,DefenseP,_,HPP,_),
    HPE2 is HPE1-AttackP,
    HPEFinal is HPE2+DefenseE,
    /* attack dari musuh */
    HPP1 is HPP - AttackE,
    HPPFinal is HPP1 + DefenseP,
    retract(enemy(Musuh,Attack,Defense,_)),
    asserta(enemy(Musuh,Attack,Defense,HPEFinal)),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,HPPFinal,Gold)),
    write('HP Player: '), write(HPPFinal),nl,
    write('HP Enemy: '), write(HPEFinal),!.

attack(Senjata) :-
    \+iniinventory(Senjata,_),
    write('Tidak ada item tersebut di inventory anda').

specialattack(Senjata) :-
    /* attack ke musuh */
    iniinventory(Senjata,_),
    enemy(_,AttackE,DefenseE,HPE),
    senjata(Senjata,AttackSen,Jenis,Owner),
    HPE1 is HPE-AttackSen,
    identitas(_,_,AttackP,DefenseP,_,HPP,_),
    AttackPSpe is AttackP*2,
    HPE2 is HPE1-AttackPSpe,
    HPEFinal is HPE2+DefenseE,
    /* attack dari musuh */
    HPP1 is HPP - AttackE,
    HPPFinal is HPP1 + DefenseP,
    retract(enemy(Musuh,Attack,Defense,_)),
    asserta(enemy(Musuh,Attack,Defense,HPEFinal)),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,HPPFinal,Gold)),
    write('HP Player: '), write(HPPFinal),nl,
    write('HP Enemy: '), write(HPEFinal),!.

specialattack(Senjata) :-
    \+iniinventory(Senjata,_),
    write('Tidak ada item tersebut di inventory anda').

run :- 
    random(0,2,Hasil),
    (Hasil=:=0->write('GAGAL KABUR BANG');cetak(0,0),keteranganmap,!).