isimaks(100).

cekpanjang(Length) :-
    findall(Name, inventory(Name, _), List),
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
    senjata(Nama, _, Jenis),
    armor(Nama, _, Jenis),
    potion(Nama, Jenis),
    asserta(inventory(Nama, Jenis)).

delItem(Nama) :-
    \+inventory(Nama, Jenis),
    write('Tidak ada item tersebut di inventory anda'),
    !,fail.

delItem(Nama) :- retract(inventory(Nama,_)),!.

inventory :-
    \+mulai(_), nl,
    write('Anda harus berada di dalam game.').

inventory :-
    mulai(_), nl,
    write('Your inventory: '), nl.
