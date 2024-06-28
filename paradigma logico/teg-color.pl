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

enemigosPais(Pais, Enemigo) :-
    ocupa(Color, Pais, _),
    ocupa(OtroColor, Enemigo, _),
    sonLimitrofes(Pais, Enemigo),
    Color \= OtroColor.

% Predicado complicado/1 verifica si un país está "complicado", es decir, 
% si tiene dos países limítrofes del mismo color y la suma de los ejércitos de ambos países es al menos 5.

estaComplicado(Pais) :-
    sonLimitrofes(Pais, OtroPais),
    sonLimitrofes(Pais, OtroPais2),
    ocupa(Color, OtroPais, Ejercito),
    ocupa(Color, OtroPais2, Ejercito2),
    Ejercito + Ejercito2 >=  5.


esFuerte(Color) :- 
    ocupa(Color, _, _),
    not((ocupa(Color, Pais, _), estaComplicado(Pais))).

% no exitse pais de este color que este complicado

% -----------------------------------------------------------------------
% Objetivos
% destruir al ejército amarillo
% conquistar Asia
% conquistar Sudamérica y África
% conquistar Europa y dos países de Oceanía
% proponer un objetivo extra, que no sea ni de conquista ni de destrucción.
% (desafío) conquistar 50 países


% si quiero ver si un color que yo elijo, ocupa el continente que elijo
conquistado1(Continente, Color) :-
    ocupa(Color, _, _),
    pais(_, Continente),
    forall(pais(Pais, Continente), ocupa(Color, Pais, _)). % para todos los países en un continente, el color ocupa ese país"

% si quiero ver si el continente que yo elijo esta conquistado por el mismo color (no me importa que color es)
conquistado2(Continente) :-
    ocupa(Color, _, _),
    pais(_, Continente),
    forall(pais(Pais, Continente), ocupa(Color, Pais, _)). % para todos los países en un continente, el color ocupa ese país"

% si quiero saber si dos continentes estan ocupados por el mismo color, sin que me importe el color
conquistado_Continentes(Continente1, Continente2, Color) :-
    conquistado1(Continente1, Color),
    conquistado1(Continente2, Color),
    Continente1 \= Continente2.

% conquistadoContinente_y_UnPedacito(Continente1, Continente2) :-
%     pais(Pais, Continete1).



% Funcion propia

mismaLetraInicial(Pais1, Pais2) :-
    pais(Pais1, _),
    pais(Pais2, _),
    sub_atom(Pais1, 0, 1, _, Letra1), % el 0 indica que se sacara el atomo de la posicion 0 y el 1 representa que el atomo a sacar termina en la posicion 1
    sub_atom(Pais2, 0, 1, _, Letra2), % 
    Letra1 = Letra2.
