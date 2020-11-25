/** Senjata (senjata,attack,jenis,Job) **/
senjata(woodensword,0,senjata,swordsman).
senjata(rocksword,5,senjata,swordsman).
senjata(ironsword,10,senjata,swordsman).
senjata(diamondsword,20,senjata,swordsman).

senjata(woodenbow,0,senjata,archer).
senjata(rockbow,5,senjata,archer).
senjata(ironbow,10,senjata,archer).
senjata(diamondbow,20,senjata,archer).

senjata(magicbook,0,senjata,sorcerer).
senjata(elderwand,5,senjata,sorcerer).
senjata(elementbending,10,senjata,sorcerer).
senjata(mindbending,20,senjata,sorcerer).

/** Armor (armor,defense,jenis) **/
armor(leather,5,armor).
armor(iron,10,armor).

/** Asesori (asesori,attack tambahan,jenis) **/
asesori(swordenhancer,5,asesori).
asesori(eagleseye,5,asesori).
asesori(amulet,5,asesori).

/** Potion (nama, jenis, harga) **/
potion(fullblood,potion,200).
potion(patronus,potion,100).
potion(powerplus,potion,150).
potion(heal,potion,50).
potion(doubleheal,potion,100).

/* lain-lain wakwkakw */
modalawal(Job) :-
    senjata(NamaSenjata,0,JenisSenjata,Job),
    asserta(iniinventory(NamaSenjata, JenisSenjata)),
    potion(NamaPotion,JenisPotion,_),
    NamaPotion = fullblood,
    asserta(iniinventory(NamaPotion, JenisPotion)),
    asserta(iniinventory(NamaPotion, JenisPotion)),
    asserta(iniinventory(NamaPotion, JenisPotion)),
    asserta(iniinventory(NamaPotion, JenisPotion)),
    asserta(iniinventory(NamaPotion, JenisPotion)).