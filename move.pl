w :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isAtas(Xawal,NextY),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

w :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isPagar(Xawal,NextY),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

w :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isStore(Xawal,NextY),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

w :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isQuest(Xawal,NextY),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

w :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isSlime(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

w :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isGoblin(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

w :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    isWolf(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

w :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal-1),
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

a :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isKiri(NextX,Yawal),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

a :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isPagar(NextX,Yawal),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

a :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isStore(NextX,Yawal),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

a :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isQuest(NextX,Yawal),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

a :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isSlime(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

a :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isGoblin(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

a :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    isWolf(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

a :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal-1),
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

s :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isBawah(Xawal,NextY),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

s :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isPagar(Xawal,NextY),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

s :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isStore(Xawal,NextY),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isQuest(Xawal,NextY),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isSlime(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isGoblin(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    isWolf(Xawal,NextY,Xawal,NextY,Xawal,NextY),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :-
    mulai(_),
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
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

s :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextY is (Yawal+1),
    retract(positionY(_)),
    asserta(positionY(NextY)),!.

d :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isKanan(NextX,Yawal),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

d :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isPagar(NextX,Yawal),
    write('ups kamu tidak bisa bergerak menembus tembok'),nl,!.

d :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isStore(NextX,Yawal),
    write('kamu sekarang sedang berada di Store, belilah beberapa barang'),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :- 
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isQuest(NextX,Yawal),
    write('kamu sekarang berada di quest, bersiaplah dan ambil misimu!'),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isSlime(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   S  L  I  M  E '),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isGoblin(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                   T  H  E   G  O  B  L  I  N '),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    isWolf(NextX,Yawal,NextX,Yawal,NextX,Yawal),
    write('       _______   __    ________     __    __   __________ '),nl,
    write('      |  _____| |  |  /  ______|   |  |  |  | |___    ___|'),nl,
    write('      |  |_____ |  | |  | ______   |  |__|  |     |  | '),nl,
    write('      |  _____| |  | |  ||___   |  |   __   |     |  |   '),nl,
    write('      |  |      |  | |  |____|  |  |  |  |  |     |  |   '),nl,
    write('      |__|      |__| |__________/  |__|  |__|     |__|   '),nl,
    write('                                                         '),nl,
    write('                     T  H  E   W  O  L  F '),nl,
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :-
    mulai(_),
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
    retract(positionX(_)),
    asserta(positionX(NextX)),!.

d :-
    mulai(_),
    positionX(Xawal),
    positionY(Yawal),
    NextX is (Xawal+1),
    retract(positionX(_)),
    asserta(positionX(NextX)),!.


    