/* buat naik level */
naiklevel(Level) :-
    identitas(Job, Level, Attack, Defense, EXP, HP, Gold),
    EXP >= 500,
    Level = 1,
    LevelBaru is (Level+1),
    AttackBaru is (Attack+35),
    DefenseBaru is (Defense+20),
    HPBaru is 500,
    retract(identitas(Job, Level, _, _, _, _, _)),
    asserta(identitas(Job, LevelBaru, AttackBaru, DefenseBaru, EXP, HPBaru, Gold)).

naiklevel(Level) :-
    identitas(Job, Level, Attack, Defense, EXP, HP, Gold),
    EXP >= 1000,
    Level = 2,
    LevelBaru is (Level+1),
    AttackBaru is (Attack+35),
    DefenseBaru is (Defense+20),
    HPBaru is 1000,
    retract(identitas(Job, Level, _, _, _, _, _)),
    asserta(identitas(Job, LevelBaru, AttackBaru, DefenseBaru, EXP, HPBaru, Gold)).

naiklevel(Level) :-
    identitas(Job, Level, Attack, Defense, EXP, HP, Gold),
    EXP >= 1500,
    Level = 3,
    LevelBaru is (Level+1),
    AttackBaru is (Attack+10),
    DefenseBaru is (Defense+2),
    HPBaru is 1100,
    retract(identitas(Job, Level, _, _, _, _, _)),
    asserta(identitas(Job, LevelBaru, AttackBaru, DefenseBaru, EXP, HPBaru, Gold)).

/* setiap kali naik level baru, HP nya otomatis jadi max hp di level tersebut ok mantap 
nilai attack itu tetep (abis battle jg tetep)
nilai defense juga tetep (abis battle jg tetep) 
EXP ga berubah, jadi kalo sebelum level up 521, setelah level up juga tetep 521 ga ngulang dari awal */

/* naik level dari 1 ke 2: naiklevel(1), begitu pula seterusnya kaoakoakoa */
