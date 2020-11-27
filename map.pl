:- dynamic(positionX/1).
:- dynamic(positionY/1).
:- dynamic(slime/6).
:- dynamic(goblin/6).
:- dynamic(wolf/6).
:- dynamic(isInStore/1).
:- dynamic(isInQuest/1).
:- dynamic(isEnemyAlive/1).

kesamping(16).
kebawah(16).

posisiAwal :-
    asserta(positionX(1)),
    asserta(positionY(1)).

isAtas(_,Y) :-
    Y =:= 0.

isBawah(_,Y) :-
    kebawah(L),
    Kol is L-1,
    Y =:= Kol.

isKiri(X,_) :-
    X =:= 0.

isKanan(X,_) :-
    kesamping(P),
    Brs is P-1,
    X =:= Brs.

isPagar(X,Y) :-
    X =:= 8,
    Y =:= 5.

isPagar(X,Y) :-
    X =:= 8,
    Y =:= 6.

isPagar(X,Y) :-
    X >= 8,
    X =< 11,
    Y =:= 7.   

isPagar(X,Y) :-
    X =:= 7,
    Y =:= 11.

isPagar(X,Y) :-
    X >= 4,
    X =< 7,
    Y =:= 12.

isPagar(X,Y) :-
    X =:= 7,
    Y =:= 13.

isPemain(X,Y) :-
    positionX(A),
    positionY(B),
    X =:= A,
    Y =:= B.

isQuest(X,Y) :-
    X =:= 7,
    Y =:= 3.

isStore(X,Y) :-
    X =:= 2,
    Y =:= 2.

isBoss(X,Y) :-
    kesamping(P),
    DX is P-2,
    kebawah(L),
    DY is L-2,
    X =:= DX,
    Y =:= DY.

generateMusuh :-
    generateSlime,
    generateGoblin,
    generateWolf.

generateSlime :-
    kebawah(L),
    kesamping(P),
    BMax is L-2,
    KMax is P-2,
    random(1,3,SX1),
    random(8,10,SX2),
    random(4,6,SX3),
    random(9,KMax,SY1),
    random(9,12,SY2),
    random(2,7,SY3),
    asserta(slime(SX1,SY1,SX2,SY2,SX3,SY3)).

generateGoblin :-
    kebawah(L),
    kesamping(P),
    BMax is L-2,
    KMax is P-2,
    random(2,3,GX1),
    random(12,BMax,GX2),
    random(12,BMax,GX3),
    random(4,7,GY1),
    random(1,4,GY2),
    random(9,11,GY3),
    asserta(goblin(GX1,GY1,GX2,GY2,GX3,GY3)).

generateWolf :-
    kebawah(L),
    kesamping(P),
    BMax is L-2,
    KMax is P-2,
    random(4,6,WX1),
    random(8,11,WX2),
    random(12,BMax,WX3),
    random(8,11,WY1),
    random(1,4,WY2),
    random(5,8,WY3),
    asserta(wolf(WX1,WY1,WX2,WY2,WX3,WY3)).

isSlime(X1,Y1,X2,Y2,X3,Y3) :-
    slime(SX1,SY1,SX2,SY2,SX3,SY3),
    (
        (
            X1 == SX1,
            Y1 == SY1
        );
        (
            X2 == SX2,
            Y2 == SY2
        );
        (
            X3 == SX3,
            Y3 == SY3
        )
    ).

isGoblin(X1,Y1,X2,Y2,X3,Y3) :-
    goblin(GX1,GY1,GX2,GY2,GX3,GY3),
    (
        (
            X1 == GX1,
            Y1 == GY1
        );
        (
            X2 == GX2,
            Y2 == GY2
        );
        (
            X3 == GX3,
            Y3 == GY3
        )
    ).

isWolf(X1,Y1,X2,Y2,X3,Y3) :-
    wolf(WX1,WY1,WX2,WY2,WX3,WY3),
    (
        (
            X1 == WX1,
            Y1 == WY1
        );
        (
            X2 == WX2,
            Y2 == WY2
        );
        (
            X3 == WX3,
            Y3 == WY3
        )
    ).

cetak(X,Y) :-
    isKanan(X,Y),
    isBawah(X,Y),
    write('#'),nl.

cetak(X,Y) :-
    isKiri(X,Y),
    write('# '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isKanan(X,Y),
    write('#'),
    nl,
    NextY is (Y+1),
    cetak(0,NextY).
    
cetak(X,Y) :-
    isAtas(X,Y),
    write('# '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isBawah(X,Y),
    write('# '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isPagar(X,Y),
    write('# '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isPemain(X,Y),
    write('P '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isQuest(X,Y),
    write('Q '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isStore(X,Y),
    write('S '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isBoss(X,Y),
    write('D '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isSlime(X,Y,X,Y,X,Y),
    write('s '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isGoblin(X,Y,X,Y,X,Y),
    write('g '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    isWolf(X,Y,X,Y,X,Y),
    write('w '),
    NextX is (X+1),
    cetak(NextX,Y).

cetak(X,Y) :-
    write('- '),
    NextX is (X+1),
    cetak(NextX,Y).

map :-
    mulai(_),
    cetak(0,0),keteranganmap,!.

keteranganmap :-
    write('Keterangan : '),nl,
    write('P : Posisi pemain '), nl,
    write('# : Pagar '), nl,
    write('S : Store '),nl,
    write('Q : Quest '),nl,
    write('D : Boss '),nl,
    write('s : slime'),nl,
    write('g : goblin'),nl,
    write('w : wolf'),nl.

w :- 
    mulai(_),
    \+isEnemyAlive(_),
    positionX(TmpX),
    positionY(TmpY),
    NextY is TmpY-1,
    (isAtas(TmpX,NextY)->
    write('Nabrak Bosque!!')
    ;isPagar(TmpX,NextY)->
    write('Nabrak Bosque!!')),!.

w :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isStore(Xawal,NextY),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    write('untuk membeli barang silahkan masukkan perintah store. '),nl,
    asserta(isInStore(1)),
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

w :- 
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isQuest(Xawal,NextY),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    write('untuk mengambil quest silahkan masukkan perintah quest.'),nl,
    asserta(isInQuest(1)),
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

w :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isSlime(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    questlist(A,_,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(slime,10,5,25)),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),!.

w :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isGoblin(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    questlist(_,A,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(goblin,10,5,25)),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),!.

w :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isWolf(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    questlist(_,_,A),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(wolf,10,5,25)),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),!.

w :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    retract(positionY(_)),
    asserta(positionY(NextY)),nl,
    set(Xawal,Yawal),
    map,!.
    
a :- 
    mulai(_),
    \+isEnemyAlive(_),
    positionX(TmpX),
    positionY(TmpY),
    NextX is TmpX-1,
    (isKiri(NextX,TmpY)->
    write('Nabrak Bosque!!')
    ; isPagar(NextX,TmpY)->
    write('Nabrak Bosque!!')),!.

a :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isStore(NextX,Yawal),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    write('untuk membeli barang silahkan masukkan perintah store. '),nl,
    asserta(isInStore(1)),
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

a :- 
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isQuest(NextX,Yawal),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    write('untuk mengambil quest silahkan masukkan perintah quest.'),nl,
    asserta(isInQuest(1)),
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

a :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isSlime(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    questlist(A,_,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    asserta(isEnemyAlive(1)),
    asserta(slime(slime,10,5,25)),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),!.

a :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isGoblin(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    questlist(_,A,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    asserta(isEnemyAlive(1)),
    asserta(goblin(slime,10,5,25)),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),!.

a :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isWolf(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    questlist(_,_,A),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(wolf,10,5,25)),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),!.

a :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),map,!.

s :- 
    positionX(TmpX),
    \+isEnemyAlive(_),
    positionY(TmpY),
    NextY is TmpY+1,
    (isBawah(TmpX,NextY)->
    write('Nabrak Bosque!!')
    ;isPagar(TmpX,NextY)->
    write('Nabrak Bosque!!')),!.

s :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isStore(Xawal,NextY),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    write('untuk membeli barang silahkan masukkan perintah store. '),nl,
    asserta(isInStore(1)),
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :- 
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isQuest(Xawal,NextY),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    write('untuk mengambil quest silahkan masukkan perintah quest.'),nl,
    asserta(isInQuest(1)),
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isSlime(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    questlist(A,_,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(slime,10,5,25)),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),!.

s :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isGoblin(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    questlist(_,A,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(goblin,10,5,25)),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),!.

s :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isWolf(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    questlist(_,_,A),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(wolf,10,5,25)),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),!.

s :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isBoss(Xawal,NextY),
    write('           _______   __    ________     __    __   __________ '),nl,
    write('          |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('          |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('          |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('          |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('          |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                              T     H    E                   '),nl,
    write('         /|                                                 /|     '),nl,
    write('        /|/|__              ||||      ||||               __/|/| '),nl,
    write('       /|/|/|/|             |  |      |  |              /|/|/|/|   '),nl,
    write('      ||||||||||__          |  |______|  |           __|||||||||| '),nl,
    write('      |||||||||||||__       |   ___ ___  |        __|||||||||||||'),nl,
    write('       |__//||//||//||__    V  ||||||||| V     __||//||//||//||_|'),nl,
    write('        |__//||//||//||/|    V   _____  V     ///||//||//||/ __|'),nl,
    write('          |__||||||||||||  ___V  V|||V V___  |||||||||||||| __| '),nl,
    write('             |__//||//||| |    V______V    | |//||//||//||__/ '),nl,
    write('      ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'),nl,
    write('      ============================================================'),nl,
    write('      ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'),nl,
    write('       ____________    ____________    ___________    ___________'),nl,
    write('      |   ______   |  |  _______   |  |   ________|  |   ________|'),nl,
    write('      |  |______|  |  |  |      |  |  |  |________   |  |________'),nl,
    write('      |  __________/  |  |      |  |  |________   |  |________   | '),nl,
    write('      |   ______   |  |  |______|  |   ________|  |   ________|  |'),nl,
    write('      |  |______|  |  |            |  |           |  |           | '),nl,
    write('      |____________|  |____________|  |___________|  |___________|'),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(boss,100,50,1000)),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),!.

s :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    retract(positionY(_)),
    asserta(positionY(NextY)),set(Xawal,Yawal),map,!.

d :- 
    mulai(_),
    \+isEnemyAlive(_),
    positionX(TmpX),
    positionY(TmpY),
    NextX is TmpX+1,
    (isKanan(NextX,TmpY)->
    write('Nabrak Bosque!!')
    ;isPagar(NextX,TmpY)->
    write('Nabrak Bosque!!')),!.

d :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isStore(NextX,Yawal),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    write('untuk membeli barang silahkan masukkan perintah store. '),nl,
    asserta(isInStore(1)),
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :- 
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isQuest(NextX,Yawal),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    write('untuk mengambil quest silahkan masukkan perintah quest.'),nl,
    asserta(isInQuest(1)),
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isSlime(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    questlist(A,_,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(slime,10,5,25)),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),!.

d :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isGoblin(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    questlist(_,A,_),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(goblin,10,5,25)),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),!.

d :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isWolf(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    questlist(_,_,A),
    A > 0,
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(wolf,10,5,25)),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),!.

d :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isBoss(NextX,Yawal),
    write('           _______   __    ________     __    __   __________ '),nl,
    write('          |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('          |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('          |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('          |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('          |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                              T     H    E                   '),nl,
    write('         /|                                                 /|     '),nl,
    write('        /|/|__              ||||      ||||               __/|/| '),nl,
    write('       /|/|/|/|             |  |      |  |              /|/|/|/|   '),nl,
    write('      ||||||||||__          |  |______|  |           __|||||||||| '),nl,
    write('      |||||||||||||__       |   ___ ___  |        __|||||||||||||'),nl,
    write('       |__//||//||//||__    V  ||||||||| V     __||//||//||//||_|'),nl,
    write('        |__//||//||//||/|    V   _____  V     ///||//||//||/ __|'),nl,
    write('          |__||||||||||||  ___V  V|||V V___  |||||||||||||| __| '),nl,
    write('             |__//||//||| |    V______V    | |//||//||//||__/ '),nl,
    write('      ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'),nl,
    write('      ============================================================'),nl,
    write('      ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'),nl,
    write('       ____________    ____________    ___________    ___________'),nl,
    write('      |   ______   |  |  _______   |  |   ________|  |   ________|'),nl,
    write('      |  |______|  |  |  |      |  |  |  |________   |  |________'),nl,
    write('      |  __________/  |  |      |  |  |________   |  |________   | '),nl,
    write('      |   ______   |  |  |______|  |   ________|  |   ________|  |'),nl,
    write('      |  |______|  |  |            |  |           |  |           | '),nl,
    write('      |____________|  |____________|  |___________|  |___________|'),nl,
    asserta(isEnemyAlive(1)),
    asserta(enemy(boss,100,50,1000)),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),!.

d :-
    mulai(_),
    \+isEnemyAlive(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    retract(positionX(_)),
    asserta(positionX(NextX)),set(Xawal,Yawal),map,!.

set(X,Y) :-
    isStore(X,Y),
    retract(isInStore(_)),!.

set(X,Y) :-
    isQuest(X,Y),
    retract(isInQuest(_)),!.

set(X,Y) :-
    1 =:= 1.
    