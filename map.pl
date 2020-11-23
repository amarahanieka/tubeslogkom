:- dynamic(positionX/1).
:- dynamic(positionY/1).
:- dynamic(slime/6).
:- dynamic(goblin/6).
:- dynamic(wolf/6).

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
    random(8,BMax,SX2),
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
    random(2,BMax,GX1),
    random(2,BMax,GX2),
    random(2,BMax,GX3),
    random(2,KMax,GY1),
    random(2,KMax,GY2),
    random(2,KMax,GY3),
    asserta(goblin(GX1,GY1,GX2,GY2,GX3,GY3)).

generateWolf :-
    kebawah(L),
    kesamping(P),
    BMax is L-2,
    KMax is P-2,
    random(2,BMax,WX1),
    random(2,BMax,WX2),
    random(2,BMax,WX3),
    random(2,KMax,WY1),
    random(2,KMax,WY2),
    random(2,KMax,WY3),
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