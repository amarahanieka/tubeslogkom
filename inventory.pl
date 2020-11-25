isimaks(100).

cekpanjang(Length) :-
    findall(Name, iniinventory(Name, _), List),
    length(List, Length).

penuh :-
    cekpanjang(Length),
    Length == 100.

addItem(_) :-
    cekpanjang(Length),
    isimaks(Max),
    Length >= Max,
    write('Sudah Penuh'),
    !,fail.

addItem(Nama) :-
    senjata(Nama, _, Jenis, _),
    armor(Nama, _, Jenis),
    potion(Nama, Jenis, _),
    asesori(Nama,_,Jenis),
    asserta(iniinventory(Nama, Jenis)).

delItem(Nama) :-
    \+iniinventory(Nama, Jenis),
    write('Tidak ada item tersebut di inventory anda'),
    !,fail.

delItem(Nama) :- retract(iniinventory(Nama,_)),!.


/* ngeprint euy */
makeListItem(ListNama,ListJenis) :-
    findall(Nama, iniinventory(Nama,_), ListNama),
    findall(Jenis, iniinventory(_,Jenis), ListJenis).


listinventory([],[]).
listinventory([A|X],[B|Y]) :-
    write('Nama barang: '),
    write(A),nl,
    write('Jenis barang: '),
    write(B),nl,nl,
    listinventory(X,Y).

inventory :-
    \+mulai(_), nl,
    write('Anda harus berada di dalam game.').

inventory :-
    mulai(_), nl,
    write('Your inventory: '), nl,
    makeListItem(ListNama,ListJenis),
    listinventory(ListNama,ListJenis).
