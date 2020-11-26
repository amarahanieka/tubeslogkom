/* questlist(Slime,Goblin,Wolf) */
:- dynamic(questlist/3).

/* questlv(Level,Slime,Goblin,Wolf,HadiahGold) */
questlv(1,1,1,1,500).
questlv(2,2,2,2,1000).
questlv(3,3,3,3,2000).

quest :-
    \+isInQuest(_),
    write('Anda hanya bisa mengambil quest di quest point'),nl,!.

quest :-
    identitas(_,Level,_, _, _, _,_),
    Level =:= 4,
    write('***********************************************************'),nl,
    write('*                -  Q U E S T  A N D A  -                 *'),nl,
    write('***********************************************************'),nl,
    write(' Anda sudah siap, Pejuang!'),nl,
    write(' Slime, Goblin, Wolf, apapun itu bukan masalah sekarang, mereka sudah menyerah'),nl,
    write(' Sekarang pergilah, kalahkan '),nl,
    write('         ***   B  O  S  S    D  R  A  G  O  N  ***'),nl,!.

quest :-
    identitas(_,Level,_, _, _, _,_),
    questlv(Level,Slime,Goblin,Wolf,HadiahGold),
    write('***********************************************************'),nl,
    write('*                -  Q U E S T  A N D A  -                 *'),nl,
    write('***********************************************************'),nl,
    write('*              KALAHKAN MUSUH-MUSUH BERIKUT               *'),nl,
    write('*             '),write(Slime),write(' Slime, '),write(Goblin),write(' Goblin, '),write(Wolf),write(' Wolf                  '),write(' *'),nl,
    write('* untuk melihat quest yang tersisa masukkan lihatquest.   *'),nl,
    write('*                    SEMOGA SUKSES                        *'),nl,
    write('***********************************************************'),nl,
    asserta(questlist(Slime,Goblin,Wolf)),!.

lihatquest :-
    \+questlist(_,_,_),
    write('anda belum punya Quest, silahkan ambil quest anda di quqest point'),nl,!.

lihatquest :-
    questlist(Slime,Goblin,Wolf),
    write('sisa quest anda: '),nl,
    write(Slime),write(' slime'),nl,
    write(Goblin),write(' goblin'),nl,
    write(Wolf),write(' wolf'),nl,!.

questberhasil :-
    questlist(0,0,0),
    identitas(Job, Level, Attack, Defense, EXP, HP, Gold),
    questlv(Level,_,_,_,Hadiah),
    write('*******************************************************************************'),nl,
    write('           ____    ____           ____    _______    ____    _______           '),nl,
    write('          (____   (____   |      (____)  (   |   )  (____)      |              '),nl,
    write('           ____)  (____   |____  |    |  |   |   |  |    |      |              '),nl,nl,
    write('           A N D A   B E R H A S I L   M E N Y E L E S A I K A N '),nl,
    write('                            Q  U  E  S  T     '),nl,nl,
    write('                           ANDA MENDAPATKAN : '),nl,
    write('                              '),write(Hadiah),write(' Gold '),nl,nl,
    write('*********************************************************************************'),nl,
    Y is Gold+Hadiah,
    retract(identitas(_,_,_,_,_,_,_)),
    asserta(identitas(Job, Level, Attack, Defense, EXP, HP, Y)),!.
