%Maestro(Personaje)
maestro(luke).
maestro(leia).
maestro(vader).
maestro(yoda).
maestro(rey).
maestro(duku).

%apareceEn( Personaje, Episodio, Lado de la luz).
apareceEn( luke, elImperioContrataca, luminoso).
apareceEn( luke, unaNuevaEsperanza, luminoso).
apareceEn( vader, unaNuevaEsperanza, oscuro).
apareceEn( vader, laVenganzaDeLosSith, luminoso).
apareceEn( vader, laAmenazaFantasma, luminoso).
apareceEn( c3po, laAmenazaFantasma, luminoso).
apareceEn( c3po, unaNuevaEsperanza, luminoso).
apareceEn( c3po, elImperioContrataca, luminoso).
apareceEn( chewbacca, elImperioContrataca, luminoso).
apareceEn( yoda, elAtaqueDeLosClones, luminoso).
apareceEn( yoda, laAmenazaFantasma, luminoso).

%caracterizacion(Personaje,Aspecto).
%aspectos:
% ser(Especie,Tamaño)
% humano
% robot(Forma)
caracterizacion(chewbacca,ser(wookiee,10)).
caracterizacion(luke,humano).
caracterizacion(vader,humano).
caracterizacion(yoda,ser(desconocido,5)).
caracterizacion(jabba,ser(hutt,20)).
caracterizacion(c3po,robot(humanoide)).
caracterizacion(bb8,robot(esfera)).
caracterizacion(r2d2,robot(secarropas)).

%elementosPresentes(Episodio, Dispositivos)
elementosPresentes(laAmenazaFantasma, [sableLaser]).
elementosPresentes(elAtaqueDeLosClones, [sableLaser, clon]).
elementosPresentes(laVenganzaDeLosSith, [sableLaser, mascara, estrellaMuerte]).
elementosPresentes(unaNuevaEsperanza, [estrellaMuerte, sableLaser, halconMilenario]).
elementosPresentes(elImperioContrataca, [mapaEstelar, estrellaMuerte] ).

% El orden de los episodios se representa de la siguiente manera:
%precede(EpisodioAnterior,EpisodioSiguiente)
precedeA(laAmenazaFantasma,elAtaqueDeLosClones).
precedeA(elAtaqueDeLosClones,laVenganzaDeLosSith).
precedeA(laVenganzaDeLosSith,unaNuevaEsperanza).
precedeA(unaNuevaEsperanza,elImperioContrataca).

% MI CODIGO

% nuevoEpisodio(Heroe, Villano, Extra, Dispositivo) :-
%     apareceEn(Heroe, Episodio, luminoso),
%     apareceEn(Villano, Episodio2, ladoOscuro),
%     apareceEn(Extra, Episodio3, LadoX).
%     % maestro(Heroe),
%     % apareceEn(Villano, Episodio, _),
    

esHeroe(Personaje) :-
    maestro(Personaje),
    forall(apareceEn(Personaje, _, Lado), Lado = luminoso ).

esVillano(Personaje) :-                                                          
    % findall(Episodio, apareceEn(Personaje, Episodio, _), Episodios),
    % length(Episodios, Cantidad),
    % Cantidad >= 2,  esta es una forma
    apareceEn(Personaje, Episodio1, _),
    apareceEn(Personaje, Episodio2, _),
    Episodio1 \= Episodio2,
    precedeSiguiente(Episodio1, Episodio2),
    seCambioDeLado(Personaje).
        
seCambioDeLado(Personaje) :-
    apareceEn(Personaje, Episodio, luminoso),
    apareceEn(Personaje, Episodio, oscuro).
seCambioDeLado(Personaje) :-
    apareceEn(Personaje, Episodio, luminoso),
    apareceEn(Personaje, OtroEpisodio, oscuro),
    precedeSiguiente(Episodio, OtroEpisodio).

precedeSiguiente(Episodio1, Episodio2) :-
    precedeA(Episodio1, Episodio2).
precedeSiguiente(Episodio1, OtroEpisodio) :-
    precedeA(Episodio1, Episodio2),
    precedeSiguiente( Episodio2, OtroEpisodio).

%El extra tiene que ser un personaje de aspecto exótico para mantener la estética de la saga. Tiene que tener un vínculo estrecho con los protagonistas, 
% que consiste en que haya estado junto al heroe o al villano en todos los episodios en los que dicho extra apareció. Se considera exótico a los robots que no 
% tengan forma de esfera y a los seres de gran tamaño (mayor a 15) o de especie desconocida.
% El dispositivo tiene que ser reconocible por el público, por lo que tiene que ser un elemento que haya estado presente en muchos episodios (3 o más)
    

extraValido(Extra, Personaje) :-
    forall(apareceEn(Extra, Episodio, _), apareceHeroeVillano(Extra, Personaje)).

apareceHeroeVillano(Extra, Personaje) :-
    apareceEn(Extra, Episodio, _),
    apareceEn(Personaje, Episodio, _),
    esHeroe(Personaje).
apareceHeroeVillano(Extra, Personaje) :-
    apareceEn(Extra, Episodio, _),
    apareceEn(Personaje, Episodio, _),
    esHeroe(Personaje).

esExotico(Extra) :-
    caracterizacion(Extra, ser( _, 15)).
esExotico(Extra) :-
    not(caracterizacion(Extra, robot(esfera))).
esExotico(Extra) :-
    caracterizacion(Extra, ser(desconocido, _)).


dispositivoReconocible(Dispositivo) :-
    esDispositivo(Dispositivo),
    aparecioEnMasDeTresPelis(Dispositivo).





nuevoEpisodio(Heroe, Villano, Extra, Dispositivo) :-
    apareceEn(Heroe, Episodio, luminoso).


% antecede(OtroEpisodio, Episodio1) :-
%     precedeA(OtroEpisodio, Episodio1).
% antecede(OtroEpisodio, Episodio2) :-
%     precedeA(OtroEpisodio, Episodio2),
%     antecede(OtroEpisodio, Episodio1)

% findall(Template, Goal, List).
% - template, es lo que quiero que devuelva para cada solucion, representa lo que estoy buscando
    % - goal, es la consulta que estás realizando. Es una meta que Prolog intentará satisfacer.
    % - list, es la variable donde se almacenarán todas las soluciones. Es una lista que contendrá todas las soluciones que
    %   satisfacen la meta.

