:- dynamic(mulai/1).
:- dynamic(job/1).
:- dynamic(udahdepan/1).
:- dynamic(identitas/7).

:- include('identitas.pl').
:- include('inventory.pl').
:- include('help.pl').
:- include('items.pl').
:- include('map.pl').
:- include('battle.pl').
:- include('enemy.pl').
:- include('store.pl').
:- include('leveling.pl').
:- include('quest.pl').

depanawal :- 
    \+udahdepan(_),
    write('  _______  _______ .__   __.      _______. __    __   __  .__   __.     '), nl,
    write(' /  _____||   ____||  \\ |  |     /       ||  |  |  | |  | |  \\ |  |   '), nl,
    write('|  |  __  |  |__   |   \\|  |    |   (----`|  |__|  | |  | |   \\|  |   '), nl,
    write('|  | |_ | |   __|  |  . `  |     \\   \\    |   __   | |  | |  . `  |   '), nl,
    write('|  |__| | |  |____ |  |\\   | .----)   |   |  |  |  | |  | |  |\\   |   '), nl,
    write(' \\______| |_______||__| \\__| |_______/    |__|  |__| |__| |__| \\__|  '), nl,
    write('             _______. _______  __  ___      ___       __  '), nl,
    write('            /       ||   ____||  |/  /     /   \\     |  | '), nl,
    write('           |   (----`|  |__   |     /     /  ^  \\    |  | '), nl,
    write('            \\   \\    |   __|  |    <     /  /_\\  \\   |  | '), nl,
    write('        .----)   |   |  |____ |  .  \\   /  _____  \\  |  | '), nl,
    write('        |_______/    |_______||__|\\__\\ /__/     \\__\\ |__| '), nl, nl, nl,
    write('Let\'s play and be a programmer!'), nl, nl,
    write('% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %'), nl,
    write('%                                                                 %'), nl,
    write('%                           Genshin Sekai                         %'), nl,
    write('%                                                                 %'), nl,    
    write('%   startgame : untuk memulai petualanganmu                       %'), nl,
    write('%   map       : menampilkan peta                                  %'), nl,
    write('%   status    : menampilkan kondisimu terkini                     %'), nl,
    write('%   w         : gerak ke utara 1 langkah                          %'), nl,
    write('%   s         : gerak ke selatan 1 langkah                        %'), nl,
    write('%   d         : gerak ke ke timur 1 langkah                       %'), nl,
    write('%   a         : gerak ke barat 1 langkah                          %'), nl,
    write('%   inventory : menampilkan status pemain                         %'), nl,
    write('%   help      : menampilkan segala bantuan                        %'), nl,
    write('%   quit      : keluar dari permainan                             %'), nl,
    write('%                                                                 %'), nl,
    write('% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %'), nl,
    asserta(udahdepan(1)).


daftar :-
    write('Choose your job!'), nl,
    write('1. swordsman'), nl,
    write('2. archer'), nl,
    write('3. sorcerer'), nl,
    write('Pilih pekerjaan yang anda inginkan (tulis swordsman/archer/sorcerer diakhiri .): '),
    read(Job), nl,
    asserta(job(Job)),
    asserta(identitas(Job, 1, 10, 5, 0, 100, 200)),
    modalawal(Job).


start :-
    \+udahdepan(_),
    depanawal.

startgame :-
    \+udahdepan(_),
    print('Pencet \'start.\' dulu hey').

startgame :-
    \+mulai(_),
    udahdepan(1),
    daftar,
    posisiAwal,
    generateMusuh,
    asserta(mulai(1)).

startgame :-
    mulai(_),
    write('Permainan sudah di mulai.').

quit :-
    \+mulai(_),
    write('Permainan belum di mulai.'), !.

quit :-
    mulai(_),
    retract(mulai(_)), retract(udahdepan(_)),
    forall(iniinventory(_, _),(retract(iniinventory(_, _)))),
    forall(identitas(_,_,_,_,_,_,_),(retract(identitas(_,_,_,_,_,_,_)))),
    retract(positionX(_)),
    retract(positionY(_)),
    write('Terima kasih sudah bermain!'),!.
