

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


