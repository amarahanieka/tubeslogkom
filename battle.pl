:- dynamic(enemy/4).
:- dynamic(identitas/7).
:- dynamic(turn/1).

turn(4).

/* Check jika special attack bisa digunakan atau tidak */
specialAvail :-
    turn(X),
    X>=3.

/* attack(senjata yang dipake, HP akhir enemy) --> mengattack enemy */
attack(Senjata) :-
    \+mulai(_),!.

attack(Senjata) :-
    \+isEnemyAlive(_),!.

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
    turn(X), XFinal is X+1, retract(turn(_)), asserta(turn(XFinal)),!,
    write('HP Player: '), write(HPPFinal),!,nl,
    write('HP Enemy: '), write(HPEFinal),!, nl,
    positionX(Xawal),
    positionY(Yawal),
    (HPEFinal=<0, HPPFinal>0->
    youwin,retract(isEnemyAlive(_)),nl,nl,
    write('Selamat, anda mendapatkan reward 100 gold.'), nl, nl,
    identitas(Job,Level,Attack,Defense,EXP,HP,Gold),
    HadiahGold is Gold+100,
    retract(identitas(Job,Level,Attack,Defense,EXP,HP,_)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,HP,HadiahGold)),
    cetak(0,0),keteranganmap,!,
    asserta(enemy(Musuh,Attack,Defense,25)),
    (isSlime(Xawal,Yawal,Xawal,Yawal,Xawal,Yawal),
    questlist(Slime,Goblin,Wolf),
    Slime1 is Slime-1,
    retract(questlist(_,Goblin,Wolf)), 
    asserta(questlist(Slime1,Goblin,Wolf)),(Slime1 =:= 0,Goblin =:= 0, Wolf =:= 0, questberhasil); 
    isGoblin(Xawal,Yawal,Xawal,Yawal,Xawal,Yawal),
    questlist(Slime,Goblin,Wolf),
    Goblin1 is Goblin-1,
    retract(questlist(Slime,_,Wolf)), 
    asserta(questlist(Slime,Goblin1,Wolf)),(Slime =:=0, Goblin1 =:= 0, Wolf =:= 0, questberhasil);
    isWolf(Xawal,Yawal,Xawal,Yawal,Xawal,Yawal),
    questlist(Slime,Goblin,Wolf),
    Wolf1 is Wolf-1,
    retract(questlist(Slime,Goblin,_)), 
    asserta(questlist(Slime,Goblin,Wolf1)),(Slime =:= 0, Goblin =:= 0, Wolf1 =:= 0,questberhasil);
    isBoss(Xawal,Yawal),youwin,bossdefeat);
    HPEFinal>0, HPPFinal=<0->youlose;
    write('Musuh Belom Mati')).


attack(Senjata) :-
    \+iniinventory(Senjata,_),
    write('Tidak ada item tersebut di inventory anda'),!.

specialattack(Senjata) :-
    \+mulai(_),!.

specialattack(Senjata) :-
    \+isEnemyAlive(_),
    write('Musuh sudah mati'),!.

specialattack(Senjata) :-
    /* attack ke musuh */
    specialAvail,
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
    turn(X), retract(turn(_)), asserta(turn(0)),!,
    write('HP Player: '), write(HPPFinal),nl,
    write('HP Enemy: '), write(HPEFinal),nl,
    positionX(Xawal),
    positionY(Yawal),
    (HPEFinal=<0, HPPFinal>0->
    youwin,retract(isEnemyAlive(_)),nl,
    nl,
    write('Selamat, anda mendapatkan reward 100 gold.'), nl, nl,
    identitas(Job,Level,Attack,Defense,EXP,HP,Gold),
    HadiahGold is Gold+100,
    retract(identitas(Job,Level,Attack,Defense,EXP,HP,_)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,HP,HadiahGold)),
    cetak(0,0),keteranganmap,!,
    asserta(enemy(Musuh,Attack,Defense,25)),
    (isSlime(Xawal,Yawal,Xawal,Yawal,Xawal,Yawal),
    questlist(Slime,Goblin,Wolf),
    Slime1 is Slime-1,
    retract(questlist(_,Goblin,Wolf)), 
    asserta(questlist(Slime1,Goblin,Wolf)),(Slime1 =:= 0,Goblin =:= 0, Wolf =:= 0, questberhasil); 
    isGoblin(Xawal,Yawal,Xawal,Yawal,Xawal,Yawal),
    questlist(Slime,Goblin,Wolf),
    Goblin1 is Goblin-1,
    retract(questlist(Slime,_,Wolf)), 
    asserta(questlist(Slime,Goblin1,Wolf)),(Slime =:=0, Goblin1 =:= 0, Wolf =:= 0, questberhasil);
    isWolf(Xawal,Yawal,Xawal,Yawal,Xawal,Yawal),
    questlist(Slime,Goblin,Wolf),
    Wolf1 is Wolf-1,
    retract(questlist(Slime,Goblin,_)), 
    asserta(questlist(Slime,Goblin,Wolf1)),(Slime =:= 0, Goblin =:= 0, Wolf1 =:= 0,questberhasil);
    isBoss(Xawal,Yawal), youwin,bossdefeat);
    HPEFinal>0, HPPFinal=<0->youlose;
    write('Musuh Belom Mati')).


specialattack(Senjata) :-
    \+specialAvail,
    write('Special attack is unavailable'),!.

specialattack(Senjata) :-
    \+iniinventory(Senjata,_),
    write('Tidak ada item tersebut di inventory anda'),!.

run :-
    \+mulai(_),!.

run :-
    \+isEnemyAlive(_),!.


run :- 
    random(0,2,Hasil),
    turn(X), XFinal is X+1, retract(turn(_)), asserta(turn(XFinal)),!,
    (Hasil=:=0->write('GAGAL KABUR BANG'),nl,
    enemy(_,AttackE,DefenseE,HPE),
    identitas(_,_,AttackP,DefenseP,_,HPP,_),
    HPP1 is HPP - AttackE,
    HPPFinal is HPP1 + DefenseP,
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,HPPFinal,Gold)),
    write('HP Player: '), write(HPPFinal),nl,!
    ;retract(isEnemyAlive(_)),
    asserta(enemy(Musuh,Attack,Defense,HP)),
    cetak(0,0),keteranganmap,!).

usepotion(potion) :-
    \+iniinventory(potion,_),
    write('Tidak ada item tersebut di inventory anda'),!.

usePotion(Potion) :-
    iniinventory(Potion,_),
    Potion == fullblood,
    identitas(_,Level,_,_,_,_,_),
    Level=:=1,
    turn(X), XFinal is X+1, retract(turn(_)), asserta(turn(XFinal)),!,
    delItem(Potion),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,100,Gold)),
    write('Your HP: '), write('100'),!.

usePotion(Potion) :-
    iniinventory(Potion,_),
    Potion == fullblood,
    identitas(_,Level,_,_,_,_,_),
    Level=:=2,
    turn(X), XFinal is X+1, retract(turn(_)), asserta(turn(XFinal)),!,
    delItem(Potion),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,500,Gold)),
    write('Your HP: '), write('500'),!.

usePotion(Potion) :-
    iniinventory(Potion,_),
    Potion == fullblood,
    identitas(_,Level,_,_,_,_,_),
    Level=:=3,
    turn(X), XFinal is X+1, retract(turn(_)), asserta(turn(XFinal)),!,
    delItem(Potion),
    retract(identitas(Job,Level,Attack,Defense,EXP,_,Gold)),
    asserta(identitas(Job,Level,Attack,Defense,EXP,1000,Gold)),
    write('Your HP: '), write('1000'),!.

youwin :-
    write('    *               +                *                    -                  *  '),nl,
    write(' *            __    __   ________   __    __      __   __   __    __    ________        *   '),nl,
    write('     +       |  |  |  | |   __   | |  |  |  |    |  | |  | |  |  |  |  |   __   |    *    '),nl,
    write('         -   |  |__|  | |  |  |  | |  |  |  |    |  | |  | |  |  |  |  |  |  |  |      + '),nl,
    write('   -         |_____   | |  |  |  | |  |  |  |    |  | |  | |  |  |  |  |  |  |  |    -  '),nl,
    write('       *      _____|  | |  |__|  | |  |__|  |    |  |_|  |_|  |  |  |  |  |  |  |   *'),nl,
    write('    +        |________| |________| |________|    |____________|  |__|  |__|  |__|     *'),nl,
    write('        -               *           +               -            *                    '),nl,!.

bossdefeat :-
    write('                                         T     H    E                   '),nl,
    write('                   ____________    ____________    ___________    ___________'),nl,
    write('                  |   ______   |  |  _______   |  |   ________|  |   ________|'),nl,
    write('                  |  |______|  |  |  |      |  |  |  |________   |  |________'),nl,
    write('                  |  __________/  |  |      |  |  |________   |  |________   | '),nl,
    write('                  |   ______   |  |  |______|  |   ________|  |   ________|  |'),nl,
    write('                  |  |______|  |  |            |  |           |  |           | '),nl,
    write('                  |____________|  |____________|  |___________|  |___________|'),nl,nl,
    write('                        H  A  S    B  E  E  N    D  E  F  E  A  T  E  D'),nl,
    write('                                   Congratulations, Warrior !'),nl,
    quit.


youlose :-
    write('     |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||  '),nl,
    write('         __    __   ________   __    __      __        ________    ________   _______        '),nl,
    write('        |  |  |  | |   __   | |  |  |  |    |  |      |   __   |  |   _____| |   ____|     '),nl,
    write('        |  |__|  | |  |  |  | |  |  |  |    |  |      |  |  |  |  |  |_____  |  |____    '),nl,
    write('        |_____   | |  |  |  | |  |  |  |    |  |      |  |  |  |  |_____   | |   ____|  -  '),nl,
    write('         _____|  | |  |__|  | |  |__|  |    |  |____  |  |__|  |   _____|  | |  |____'),nl,
    write('        |________| |________| |________|    |_______| |________|  |________| |_______|   '),nl,nl,
    write('     |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||  '),nl,
    quit.