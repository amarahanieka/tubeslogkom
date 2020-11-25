
/** equSwordsman(ID,senjata,val,jenis) **/
/* jika jenisnya senjata maka val = attack, jika jenisnya armor maka val = defense, jika jenisnya asesori maka val = attack */
equSwordsman(0,woodensword,0,senjata).
equSwordsman(1,rocksword,5,senjata).
equSwordsman(2,ironsword,10,senjata).
equSwordsman(3,diamondsword,20,senjata).
equSwordsman(4,leather,5,armor).
equSwordsman(5,iron,10,armor).
equSwordsman(6,swordenhancer,5,asesori).

/** equArcher(ID,senjata,val,jenis) **/
/* jika jenisnya senjata maka val = attack, jika jenisnya armor maka val = defense, jika jenisnya asesori maka val = attack */
equArcher(0,woodenbow,0,senjata).
equArcher(1,rockbow,5,senjata).
equArcher(2,ironbow,10,senjata).
equArcher(3,diamondbow,20,senjata).
equArcher(4,leather,5,armor).
equArcher(5,iron,10,armor).
equArcher(6,eagleseye,5,asesori).

/** equSocrerer(ID,senjata,val,jenis) **/
/* jika jenisnya senjata maka val = attack, jika jenisnya armor maka val = defense, jika jenisnya asesori maka val = attack */
equSocrerer(0,magicbook,0,senjata).
equSocrerer(1,elderwand,5,senjata).
equSocrerer(2,elementbending,10,senjata).
equSocrerer(3,mindbending,20,senjata).
equSocrerer(4,leather,5,armor).
equSocrerer(5,iron,10,armor).
equSocrerer(6,amulet,5,asesori).

store :-
    \+isInStore(_),
    write('Anda hanya bisa berbelanja di Store'),nl,!.

store :-
    write('Selamat datang di store! Ingin beli apa Anda hari ini?'),nl,
    write('beliequipment. / belipotion.'),nl.

beliequipment :-
    \+isInStore(_),
    write('Anda hanya bisa membeli equipment di Store'),nl,!.

beliequipment :-
    /* misalnya harga untuk gacha itu 150 gold */
    identitas(_,_,_,_,_, Gold),
    Gold < 150,
    write('Maaf, emas anda belum cukup. Lakukan quest untuk bisa dapatkan emas!'),nl,!.

beliequipment :- 
    job(Job),
    Job == swordsman,
    findall(Name, equSwordsman(_,Name,_,_), List),
    length(List,Length),
    X is Length,
    random(0,X,Hasil),
    equSwordsman(Hasil,Dapat,_,_),
    addItem(Dapat),
    identitas(Job, Level, Attack, Defense, MaxHP, Gold),
    Y is (Gold-150),
    retract(identitas(Job, Level, Attack, Defense, MaxHP, Gold)),
    asserta(identitas(Job, Level, Attack, Defense, MaxHP, Y)),
    write('Selamat, anda mendapatkan '),
    write(Dapat),nl,
    write('sisa uang anda = '), write(Y),nl,
    write('Selamat datang di store! Ingin beli apa Anda hari ini?'),nl,
    write('beliequipment. / belipotion.'),nl,!.

beliequipment :- 
    job(Job),
    Job == archer,
    findall(Name, equArcher(_,Name,_,_), List),
    length(List,Length),
    X is Length,
    random(0,X,Hasil),
    equArcher(Hasil,Dapat,_,_),
    addItem(Dapat),
    identitas(Job, Level, Attack, Defense, MaxHP, Gold),
    Y is (Gold-150),
    retract(identitas(_,_,_,_,_,_)),
    asserta(identitas(Job, Level, Attack, Defense, MaxHP, Y)),
    write('Selamat, anda mendapatkan '),
    write(Dapat),nl,
    write('sisa uang anda = '), write(Y),nl,
    write('Selamat datang di store! Ingin beli apa Anda hari ini?'),nl,
    write('beliequipment. / belipotion.'),nl,!.

beliequipment :- 
    job(Job),
    Job == socrerer,
    findall(Name, equSoc(_,Name,_,_), List),
    length(List,Length),
    X is Length,
    random(0,X,Hasil),
    equSoc(Hasil,Dapat,_,_),
    addItem(Dapat),
    identitas(Job, Level, Attack, Defense, MaxHP, Gold),
    Y is (Gold-150),
    retract(identitas(_,_,_,_,_,_)),
    asserta(identitas(Job, Level, Attack, Defense, MaxHP, Y)),
    write('Selamat, anda mendapatkan '),
    write(Dapat),nl,
    write('sisa uang anda = '), write(Y),nl,
    write('Selamat datang di store! Ingin beli apa Anda hari ini?'),nl,
    write('beliequipment. / belipotion.'),nl,!.

belipotion :-
    \+isInStore(_),
    write('Anda hanya bisa membeli potion di Store'),nl,!.

belipotion :-
    findall(Name, potion(Name,_,_), List),
    write('potion apa yang ingin anda beli?'),nl,
    printlist(List),read(Pot),nl,
    bisabelipotion(Pot),!.

bisabelipotion(Pot) :-
    potion(Pot,_,Harga),
    identitas(Job, Level, Attack, Defense, MaxHP, Gold),
    Harga > Gold,
    write('maaf uang anda tidak cukup untuk membeli potion ini'),nl,!.

bisabelipotion(Pot) :-
    potion(Pot,_,Harga),
    identitas(Job, Level, Attack, Defense, MaxHP, Gold),
    X is Gold-Harga,
    retract(identitas(_,_,_,_,_,_)),
    asserta(identitas(Job, Level, Attack, Defense, MaxHP, X)),
    addItem(Pot),
    write('Yeay, anda sudah membeli 1 buah '),write(Pot),nl,
    write('sisa uang anda = '), write(X),nl,
    write('Selamat datang di store! Ingin beli apa Anda hari ini?'),nl,
    write('beliequipment. / belipotion.'),nl,!.

printlist([]).

printlist([X|List]) :-
    write(X),nl,
    printlist(List).
