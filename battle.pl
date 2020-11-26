:- dynamic(enemy/4).
:- dynamic(identitas/7).
:- dynamic(count/1).
:- dynamic(specialstatus/1).

count(0).

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
    write('HP Player: '), write(HPPFinal),!,nl,
    write('HP Enemy: '), write(HPEFinal),!, nl,
    (HPEFinal=<0, HPPFinal>0->
    write('You Win'),nl,
    cetak(0,0),keteranganmap,!;
    HPEFinal>0, HPPFinal=<0->write('You Lose');
    write('Musuh Belom Mati')),
    count(X),
    X1 is X+1,
    retract(count(_)),
    asserta(count(X1)),!.

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
    write('HP Enemy: '), write(HPEFinal),nl,
    (HPEFinal=<0, HPPFinal>0->
    write('You Win'),nl,
    cetak(0,0),keteranganmap,!;
    HPEFinal>0, HPPFinal=<0->write('You Lose');
    write('Musuh Belom Mati')),
    count(X),
    X1 is X+1,
    retract(count(_)),
    asserta(count(X1)),!.

specialattack(Senjata) :-
    \+iniinventory(Senjata,_),
    write('Tidak ada item tersebut di inventory anda').

run :- 
    random(0,2,Hasil),
    (Hasil=:=0->write('GAGAL KABUR BANG');cetak(0,0),keteranganmap,!).

usepotion(potion) :-
    \+iniinventory(potion,_),
    write('Tidak ada item tersebut di inventory anda').

usepotion(potion) :-
    iniinventory(potion,_),
    potion == fullblood,
    identitas(_,1,_,_,_,_,_),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,100,Gold)),
    write("Your HP: "), write('100'),!.

usepotion(potion) :-
    iniinventory(potion,_),
    potion == fullblood,
    identitas(_,2,_,_,_,_,_),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,500,Gold)),
    write("Your HP: "), write('500'),!.

usepotion(potion) :-
    iniinventory(potion,_),
    potion == fullblood,
    identitas(_,3,_,_,_,_,_),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,1000,Gold)),
    write("Your HP: "), write('1000'),!.

usepotion(potion) :-
    iniinventory(potion,_),
    potion == heal,
    identitas(_,_,_,_,_,HP,_),
    HPheal is HP + 50,
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,HPheal,Gold)),
    write("Your HP: "), write(HPheal),!.

usepotion(potion) :-
    iniinventory(potion,_),
    potion == heal,
    identitas(_,_,_,_,_,HP,_),
    HPdoubleheal is HP + 100,
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,HPdoubleheal,Gold)),
    write("Your HP: "), write(HPdoubleheal),!.