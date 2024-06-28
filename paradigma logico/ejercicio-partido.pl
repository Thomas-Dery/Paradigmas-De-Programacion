/*
Punto 1: Acciones del partido
Conocemos el nombre de cada jugador y las acciones que fueron pasando en el partido.
Las cuales son:
el dibu hizo una atajada en el minuto 122. También, en la tanda de penales atajó 2 de ellos.
messi metió 2 goles, uno en el minuto 108 de jugada y otro en el minuto 23 de penal. A su vez, también metió el primer penal 
de la tanda.
montiel metió el último penal de la tanda de penales.
Se pide modelar la base de conocimientos con las acciones y quienes las realizaron.
*/
jugador(dibu).
jugador(messi).
jugador(montiel).

accion(dibu, atajada(122)).
accion(dibu, atajadaTP(2)).
accion(messi, gol(108)).
accion(messi, gol(23)).
accion(messi, penalTP(1)).
accion(montiel, penalTP(5)).

puntajePorAccion(atajadaTP(Cant), Puntaje) :-
    Puntaje is 15 * Cant.

puntajePorAccion(atajada(Min), Puntaje) :-
    Puntaje is (Min + 10).

puntajePorAccion(gol(Min), Puntaje) :-
    Puntaje is (Min + 20).

puntajePorAccion(golTP(Pos), Puntaje) :-
    Pos = 1,
    Puntaje is 45.

puntajePorAccion(golTP(Pos), Puntaje) :-
    Pos = 5,
    Puntaje is 80.

% findall(Template, Goal, List).
% - template, es lo que quiero que devuelva para cada solucion, representa lo que estoy buscando
% - goal, es la consulta que estás realizando. Es una meta que Prolog intentará satisfacer.
% - list, es la variable donde se almacenarán todas las soluciones. Es una lista que contendrá todas las soluciones que
%   satisfacen la meta.
puntosJugadorPorAccion( Jugador, Puntaje) :-
    accion(Jugador, Accion),
    puntaje(Accion, Puntaje).

puntosJugador(Jugador, Puntos) :-
    jugador(Jugador),
    findall(Puntaje, puntosJugadorPorAccion( Jugador, Puntaje), Puntajes),
    sum_list(Puntajes, Puntos).
    

puntosTotales(Jugadores, Puntos) :-
    findall(PuntosJugador, (member(Jugador, Jugadores), puntosJugador(Jugador, PuntosJugador)), Puntajes),
    sum_list(Puntajes, Puntos).

puntosTotalesJugadores(Puntos) :-
    findall(Punto, puntosJugador(_, Punto), Puntajes),
    sum_list(Puntajes, Puntos).
/*
Punto 2: Puntajes de las acciones
Queremos saber cuantos puntos suma cada acción. Los cuales son calculados de la siguiente forma:
Para las atajadas tanda de penales, suman 15 * la cantidad que se hayan atajado
Para las otras atajadas, el puntaje se calcula como el minuto en el que ocurrió más 10
Para los goles, se calcula como el minuto en el que se metió más 20
Por último, para los penales que se metieron, en caso de que sea el primero suma  45 puntos mientras que si es el último suma 80 puntos
También, queremos saber cuantos puntos suma cada jugador. Es necesario que este predicado sea inversible.
*/

/*
Punto 3: Puntaje total
Dada una lista de jugadores, queremos saber cuantos puntos sumaron todos.
*/

