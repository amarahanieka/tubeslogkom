naiklevel :-
    identitas(Job, Level, Attack, Defense, MaxHP, Gold),
    Level = 1,
    LevelBaru is (Level+1),
    AttackBaru is (Attack+35),
    DefenseBaru is (Defense+20),
    MaxHPBaru is (MaxHP+400),
    retract(identitas(Job, Level, _, _, _, _)),
    asserta(identitas(Job, LevelBaru, AttackBaru, DefenseBaru, MaxHPBaru, Gold)).