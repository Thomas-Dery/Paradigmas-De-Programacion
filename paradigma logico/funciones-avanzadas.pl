

esHombre(gonza).
esHombre(jaimito).
esMortal(Alguien) :- esHombre(Alguien).  % si esHombre(Alguien) ---> esMortal(Alguien)

clima(soleado, 23).
clima(lluvia, 100).

ubicacion(pasto, bsas).
ubicacion(vereda, cordoba).
ubicacion(jardin, rosario).

seRego(pasto).
seRego(vereda).
seRego(jardin).
seRego(canchaDeFutbol).

elAireLibre(pasto).
elAireLibre(vereda).
elAireLibre(jardin).

clima(soleado, 23).
clima(lluvia, 100).

clima(pasto, soleado, 23).
clima(vereda, lluvia, 100).

llovioMucho(Ciudad) :- clima(Ciudad, lluvia, Cantidad), Cantidad > 20.

seMojo(Lugar) :- seRego(Lugar).
seMojo(Lugar) :- elAireLibre(Lugar), ubicacion(Lugar, Ciudad), llovioMucho(Ciudad).

/* --------------------------------------------------------------------------------------- */

% persona(juancito, titulo, ingles).
% persona(pepe, titulo, espaniol).
% person(ramon, estudiante, aleman).
% person(rodolfo, estudiante, frances).

% paisImportante(usa).
% paisImportante(argentina).
% paisImportante(alemania).

% idioma(ingles, usa).
% idioma(espaniol, argentina).
% idioma(aleman, alemania).
% idioma(chino, china).

% sabeIdiomaImportante(Alguien) :- idioma(paisImportante(Pais)).
% persona(Alguien) :-  buenIngeniero(Alguien, titulo, idioma).

/* como lo hizo el profesor */

sabe(juan, ingles).
sabe(gonza, arabe).

titulo(juan, ingeniero).
titulo(tito, doctor).

fondos(juan, 1000, arabe),

buenIngeniero(P) :- titulo(P, ingeniero), manejaIdioma(P), fondos(P, F, _) > 900.


% --------------------------------------------

% mismaLetraInicial(Pais1, Pais2) :-
%     pais(Pais1, _),
%     pais(Pais2, _),
%     sub_atom(Pais1, 0, 1, _, Letra1), % el 0 indica que se sacara el atomo de la posicion 0 y el 1 representa que el atomo a sacar termina en la posicion 1
%     sub_atom(Pais2, 0, 1, _, Letra2), %
%     Letra1 = Letra2.

% ---------------------------------------------

/*
member(X, [1, 2, 3]).
member(3, L), lenght(L, 4). lista a las que pertenezca 3 y la lista tenga 4 elementos (member no es inversibe, al igual que el forall y el not por si mismos)

sumList(L, 12). Suma todos los elemtnos de la lista L

append(L1, L2, L3). concatena Y desconcatena las listas (L3 es la lista resultante)
append([1, 2, 3], [4, 5, 6], L3). ---devuelve--- L3 = [1, 2, 3, 4, 5, 6]
append(L1, [4,5,6], [1,2,3,4,5,6]). ---devuelve--- L1 = [1, 2, 3]
append(L1, L2, [1,2,3,4,5,6]). ---devuelve--- todas las posibles variantes de L1 Y L2


findall(Template, Goal, List).

- template, es lo que quiero que devuelva para cada solucion, representa lo que estoy buscando
- goal, es la consulta que estás realizando. Es una meta que Prolog intentará satisfacer.
- list, es la variable donde se almacenarán todas las soluciones. Es una lista que contendrá todas las soluciones que
  satisfacen la meta.
*/

paises(america, [argentina, chile, brasil, uruguay]).
paises(europa, [espania, francia, inglaterra]).
paises(oceania, [australia, nueva_zelanda]).
paises(falopa, [qcy]).

cuantosPaisesHay(Continente, Cant) :-
    paises(Continente, Pais),
    length(Pais, Cant).

tienexPaises(Continente, X) :- % no es inversible, solo la uso como condicion
    cuantosPaisesHay(Continente, Cant),
    Cant = X.

tieneMasPaisesQue(C1, C2) :- % no es inversible, solo la uso como condicion
    cuantosPaisesHay(C1, X),
    cuantosPaisesHay(C2, Y),
    X > Y.

todosLosPaises(Continente, ListaPaises) :-
    paises(Continente, Paises),
    findall(Pais, member(Pais, Paises), ListaPaises).


