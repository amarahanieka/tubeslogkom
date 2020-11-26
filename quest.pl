:- dynamic(questlist/3).

/* questlv(Level,Slime,Goblin,Wolf) */
questlv(1,1,1,1).
questlv(2,2,2,2).
questlv(3,3,3,3).

quest :-
    \+isInQuest(_),
    write('Anda hanya bisa mengambil quest di quest point'),nl,!.

quest :-
    write('aya'),nl,
    identitas(_,Level,_, _, _, _,_),
    questlv(Level,Slime,Goblin,Wolf),
    write('***********************************************************'),nl,
    write('*                -  Q U E S T  A N D A  -                 *'),nl,
    write('***********************************************************'),nl,
    write('*              KALAHKAN MUSUH-MUSUH BERIKUT               *'),nl,
    write('*             '),write(Slime),write(' Slime, '),write(Goblin),write(' Goblin, '),write(Wolf),write(' Wolf                 '),write(' *'),nl,
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
