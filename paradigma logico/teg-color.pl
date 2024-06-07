:- use_module(paises).
:- use_module(ocupacion).


sonLimitrofes(P1, P2) :- limita(P1, P2).
sonLimitrofes(P1, P2) :- limita(P2, P1).

limitaConOtroContinente(P1) :- pais(P1, C1), pais(P2, C2), sonLimitrofes(P1, P2), C1 \= C2.



/* 
Predicado que me diga los enemigos de un país, es decir sus limítrofes que no tengan el mismo color.
Predicado complicado/1 verifica si un país está "complicado", es decir, si tiene dos países limítrofes del mismo color y la suma de los ejércitos de ambos países es al menos 5.
Predicado puede_atacar/1 que determine si un país tiene más ejércitos que uno de sus países limítrofes que sea de otro color.
Un ejercito esFuerte/1 si ninguno de sus países está complicado. 
*/ 


limitrofesDistintoColor(Pais, OtroPais) :- 
    ocupa(Color, Pais, _), 
    ocupa(OtroColor, OtroPais, _),
    sonLimitrofes(Pais, OtroPais),
    Color \= OtroColor.

complicado(Pais) :-
    sonLimitrofes(Pais, OtroPais1),
    sonLimitrofes(Pais, OtroPais2), 
    ocupa(Color, OtroPais1, Ejercito1),
    ocupa(Color, OtroPais2, Ejercito2),
    Ejercito1 + Ejercito2 >= 5.

puede_atacar(Pais) :-
    sonLimitrofes(Pais, PaisesLimitrofes),
    ocupa(Color1, PaisesLimitrofes, Ejercito),
    ocupa(Color2, PaisesLimitrofes, Ejercito2),
    Color1 \= Color2,
    Ejercito1 > Ejercito2.
