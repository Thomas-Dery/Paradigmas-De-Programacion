-- PARTE 1

data Personaje = UnPersonaje {
    nombre :: String,
    dinero :: Int,
    felicidad :: Int
} deriving (Show, Eq)

cartman :: Personaje
cartman = UnPersonaje "cartman" 0 0

butters :: Personaje
butters = UnPersonaje "butters" 100 100

kenny = UnPersonaje "kenny" 500 500

irEscuela :: Personaje -> Personaje
irEscuela personaje
    | nombre personaje == "butters" = personaje{felicidad = felicidad personaje + 20}
    | otherwise = personaje{felicidad = felicidad personaje - 20}

cheesyProofs :: Int -> Personaje -> Personaje
cheesyProofs cantidad personaje = personaje{felicidad = felicidad personaje + 10, dinero = dinero personaje - (cantidad * 10)} 

trabajar :: String -> Personaje -> Personaje
trabajar trabajo personaje = personaje{dinero = dinero personaje + length(trabajo)}

dobleTurno :: String -> Personaje -> Personaje
dobleTurno trabajo personaje = personaje{dinero = dinero personaje + 2 * length(trabajo), felicidad = felicidad personaje - length(trabajo)}


jugarWow :: Int -> Int -> Personaje -> Personaje
jugarWow amigos horas personaje
    | horas < 5 = personaje{dinero = dinero personaje - (horas*10), felicidad = felicidad personaje + ((amigos*horas) +10) }
    | otherwise = personaje{dinero = dinero personaje - (horas*10), felicidad = felicidad personaje + (amigos * 50)}

-- PARTE 2

type Accion = Personaje -> Personaje

repetirAccionNVeces :: Personaje -> Accion -> Int -> Personaje
repetirAccionNVeces personaje _ 0 = personaje
repetirAccionNVeces personaje accion n
                                | n > 0 = repetirAccionNVeces (accion personaje) accion (n-1)
                                | otherwise = error "no se permite numeros negativos"

actividades :: [Accion] -> Personaje -> Personaje
actividades listaAct personaje = foldl (\acc funcion -> funcion acc) personaje listaAct

type Logro = Personaje -> Bool

serMillonario :: Personaje -> Bool
serMillonario =  (dinero cartman <) . dinero --cantDinero personaje > cantDinero cartman

estarContento :: Personaje -> Bool
estarContento = (100 <) . felicidad -- Nivel de felicidad deseado 100, felicidad personaje >= 100

verPrograma :: Personaje -> Bool
verPrograma = (10 <) . dinero

sueñoAmericano :: Personaje -> Bool
sueñoAmericano personaje = ((200 <) . dinero) personaje && ((200 <) . felicidad) personaje

actividadDecisiva :: Logro -> Accion -> Personaje -> Bool
actividadDecisiva logro act personaje = not (logro personaje) && logro (act personaje)

personajesConActDecisiva :: [Personaje] -> Logro -> Accion -> [Personaje]
personajesConActDecisiva lista logro act = filter (actividadDecisiva logro act) lista

{-

Teoria
Dar 1 ejemplo por concepto visto en clase. En caso de que crean necesario justificar su uso. 
Por ejemplo: En la función X use composición por tal y tal motivo.

Parte 1:
Actividades de los personajes

En el pueblo de South Park, hay varios personajes conocidos. De cada uno se conoce su nombre, la cantidad de dinero que posee y su nivel de felicidad (que puede ser mayor o igual a cero, pero nunca negativo).

Los personajes pueden realizar diversas actividades que los afectan de la siguiente manera:
Ir a la escuela primaria de South Park: resta 20 de felicidad al personaje, a excepción de Butters, quien aumenta su felicidad en la misma cantidad.
Comer una cierta cantidad de Cheesy Poofs: aumenta 10 de felicidad y resta 10$ por cada Cheesy Poof consumido.
Ir a trabajar: ganan una cantidad de dinero dependiendo del trabajo. Si es en el "Restaurante de City Wok", ganan 23$ porque tiene 23 caracteres.
Hacer doble turno: implica ir a trabajar el doble de tiempo y restar tanta felicidad como caracteres tenga el trabajo.
Jugar World of Warcraft: por cada amigo con el que juega cada hora aumenta 10 de felicidad, y por cada hora pierde $10. A partir de las 5 horas no aumenta más la felicidad, pero el dinero sigue disminuyendo. 
Por ejemplo, si Stan juega con 3 amigos por 8 horas aumenta en 150 su felicidad y pierde $80.
Realizar una actividad inventada que modifique al personaje de alguna manera.

Modelar algunos personajes, implementar las acciones mencionadas y mostrar ejemplos de invocación y respuesta: 
Cartman come una docena de Cheesy Poofs.
Stan hace doble turno barriendo la nieve.
Butters va a la escuela y luego realiza la actividad inventada.

Parte 2:

Múltiples actividades
Surgieron nuevas actividades que se necesitan modelar:
Dada una persona, una accion y una cantidad, se quiere repetir una acción n veces.
Por ejemplo, queremos que Stan trabaje 3 veces para la “Mafia” entonces el dinero de Stan debería aumentar en 15$. Al terminar de ejecutar la función, si Stan tenía 10$, ahora debería tener 25$.
Dada una lista de actividades se quiere obtener al personaje después de realizar todas. 

Logros
También se definen logros que pueden ser alcanzados por un personaje. Se quiere saber si una persona cumple con ese logro. Definir los siguientes:
Ser millonario: lo alcanza si tiene más dinero que Eric Cartman.
Estar contento: dado un nivel de felicidad deseado, lo alcanza si su propia felicidad lo supera.
Ir a ver el programa de Terrance y Phillip: lo alcanza si tiene al menos 10$.
Agregar uno inventado por ustedes.

Se quiere averiguar si una actividad resulta decisiva para un personaje para alcanzar un logro. Es decir, si alguien no alcanza un logro, pero que cuando realiza la acción indicada sí lo logra. 
Por ejemplo, si Kenny tiene 6$ no puede ir a ver a Terrance y Phillip, pero si va a trabajar para la "Mafia" pasaría a tener 11$, lo lograría por lo tanto, dicha actividad resulta decisiva.
Dada una lista de personajes, un logro y una actividad, se quiere saber para cuáles de ellos esa actividad es decisiva.


-}