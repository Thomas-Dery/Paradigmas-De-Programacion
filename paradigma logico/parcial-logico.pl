% Definición de personas
persona(nina, 22, 1.60).
persona(marcos, 8, 1.32).
persona(osvaldo, 13, 1.29).

% Definición de atracciones en el Parque de la Costa
atraccion(parque_de_la_costa, tren_fantasma, edad_minima(12)).
atraccion(parque_de_la_costa, montana_rusa, altura_minima(1.30)).
atraccion(parque_de_la_costa, maquina_tiquetera, sin_restricciones).

% Definición de atracciones en el Parque Acuático
atraccion(parque_acuatico, tobogan_gigante, altura_minima(1.50)).
atraccion(parque_acuatico, rio_lento, sin_restricciones).
atraccion(parque_acuatico, piscina_de_olas, edad_minima(5)).

% Definición de pasaportes
pasaporte(nina, basico(20)).  
pasaporte(marcos, flex(15, tren_fantasma)).  
pasaporte(osvaldo, premium).  

% Definición de juegos y sus costos en créditos
juego_comun(tren_fantasma, 5).
juego_comun(montana_rusa, 8).
juego_comun(maquina_tiquetera, 2).
juego_comun(rio_lento, 3).

juego_premium(piscina_de_olas).
juego_premium(tobogan_gigante).

% verifica si la persona puede subir a la atracción
puedeSubir(Persona, Atraccion) :-
    persona(Persona, Edad, _),
    atraccion(_, Atraccion, edad_minima(EdadMinima)),
    Edad >= EdadMinima,
    cumplePasaporte(Persona, Atraccion).
puedeSubir(Persona, Atraccion) :-
    persona(Persona, _, Altura),
    atraccion(_, Atraccion, altura_minima(AlturaMinima)),
    Altura >= AlturaMinima,
    cumplePasaporte(Persona, Atraccion).
puedeSubir(Persona, Atraccion) :-
    atraccion(_, Atraccion, sin_restricciones),
    cumplePasaporte(Persona, Atraccion).

% verifica si la persona puede subir a todas las atracciones de un parque
esParaElle(Persona, Parque) :-
    persona(Persona, _, _),
    forall(atraccion(Parque, Atraccion, _), puedeSubir(Persona, Atraccion)).

% verifica si es mala idea que un grupo de personas vaya a un parque
malaIdea(Personas, Parque) :-
    existeAtraccionParaTodos(Personas, Parque).

% ----------------------------------------------------

% Verifica si hay alguna atracción en el parque que todos puedan subir
existeAtraccionParaTodos(Personas, Parque) :-
    atraccion(Parque, Atraccion, _),
    todosPuedenSubir(Personas, Atraccion).

% Verifica si todos en la lista pueden subir a una atracción
todosPuedenSubir([], _).
todosPuedenSubir([Persona|Resto], Atraccion) :-
    puedeSubir(Persona, Atraccion),
    todosPuedenSubir(Resto, Atraccion).

% verifica si todas las atracciones estan en el mismo parque y sin repetidos
programaLogico(Programa) :-
    length(Programa, Length),
    Length > 0,  % Verificar que la lista no esté vacía
    programaEnMismoParque(Programa, Parque),
    sinRepetidos(Programa).

% Verifica si todas las atracciones están en el mismo parque
programaEnMismoParque([Atraccion1|Resto], Parque) :-
    atraccion(Parque, Atraccion1, _),
    forall(member(Atraccion, Resto), atraccion(Parque, Atraccion, _)).

% Verifica si una lista no tiene elementos repetidos
sinRepetidos([]).
sinRepetidos([_]).
sinRepetidos([Cabeza|Cola]) :-
    member(Cabeza, Cola),
    sinRepetidos(Cola).


% devuelve la lista de atracciones del subprograma
hastaAca(_, [], []).
hastaAca(Persona, [Atraccion|Resto], []) :-
    puedeSubir(Persona, Atraccion).
hastaAca(Persona, [Atraccion|Resto], [Atraccion|Subprograma]) :-
    puedeSubir(Persona, Atraccion),
    hastaAca(Persona, Resto, Subprograma).

% -------------------------------------------------------------------------------------------------------------------------

% verifica si el pasaporte de la persona permite subir a la atracción
cumplePasaporte(Persona, Atraccion) :-
    pasaporte(Persona, basico(Creditos)),
    juego_comun(Atraccion, Costo),
    Creditos >= Costo.
cumplePasaporte(Persona, Atraccion) :-
    pasaporte(Persona, flex(Creditos, AtraccionEspecifico)),
    Atraccion == AtraccionEspecifico,  % Verifica que la atracción sea la específica del pasaporte flex
    juego_comun(Atraccion, Costo),
    Creditos >= Costo.
cumplePasaporte(Persona, Atraccion) :-
    pasaporte(Persona, premium).

/*
casos de prueba:

puedeSubir:
puedeSubir(nina, tren_fantasma). % True
puedeSubir(nina, tobogan_gigante). % False
puedeSubir(marcos, montana_rusa). % True
puedeSubir(marcos, piscina_de_olas). % False
puedeSubir(osvaldo, maquina_tiquetera). % True

esParaElle:
esParaElle(nina, parque_de_la_costa). % True
esParaElle(nina, parque_acuatico). % False
esParaElle(marcos, parque_acuatico). % False

malaIdea:
malaIdea([nina, marcos, osvaldo], parque_de_la_costa). % True (todos pueden subir al menos a una atracción)
malaIdea([nina, marcos, osvaldo], parque_acuatico). % False (no todos pueden subir a al menos una atracción) 

programaLogico:
programaLogico([tren_fantasma, montana_rusa]). % True (están en el mismo parque)
programaLogico([tobogan_gigante, piscina_de_olas]). % True (están en el mismo parque)
programaLogico([tobogan_gigante, montana_rusa]). % False (no están en el mismo parque)

hastaAca:
hastaAca(nina, [tren_fantasma, montana_rusa, maquina_tiquetera], Subprograma). ---devuelve--- Subprograma = [tren_fantasma, montana_rusa, maquina_tiquetera].
hastaAca(marcos, [tren_fantasma, montana_rusa, maquina_tiquetera], Subprograma). ---devuelve--- Subprograma = [].

cumplePasaporte: 
cumplePasaporte(nina, tren_fantasma). % True (tiene pasaporte básico con suficientes créditos)
cumplePasaporte(marcos, tobogan_gigante). % False (no tiene pasaporte para atracciones premium)
cumplePasaporte(nina, piscina_de_olas). % False (no tiene pasaporte para atracciones premium)
cumplePasaporte(osvaldo, piscina_de_olas). % True (tiene pasaporte premium)

todosPuedenSubir:
todosPuedenSubir([nina, marcos, osvaldo], tren_fantasma). % false (marcos no puede) 
todosPuedenSubir([nina, marcos, osvaldo], piscina_de_olas). % False (no todos pueden subir a piscina_de_olas)

*/