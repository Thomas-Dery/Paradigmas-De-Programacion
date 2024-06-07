
data Fremen = UnFremen {
    nombre :: String,
    tolerancia :: Float,
    titulos :: [String],
    reconocimientos :: Int
}deriving (Show, Eq)

type Tribu = [Fremen]

-- FREMENS DE EJEMPLO

stilgar :: Fremen
stilgar = UnFremen "Stilgar" 150 ["Guía", "Fachero", "habiidoso"] 3

marcelo :: Fremen
marcelo = UnFremen "Marcelo" 120 ["Domador"] 2

juan :: Fremen
juan = UnFremen "Juan" 90 ["Domador", "Fachero"] 5

gonza :: Fremen
gonza = UnFremen "Gonza" 150 ["Domador", "Aburrido", "Ruidoso", "Oloroso"] 1

-- TRIBUS DE EJEMPLO

tribu1 :: Tribu
tribu1 = [stilgar, marcelo, juan]

tribu2 :: Tribu
tribu2 = [gonza, marcelo, juan]

{-  
    PARTE 1

    Averiguar cómo queda un Fremen al recibir un nuevo reconocimiento.
    Saber si hay algún candidato a ser el elegido. Son candidatos quienes tengan el título de "Domador" y una tolerancia a la especia de más de 100.
    Hallar al Elegido: Es el Fremen de la tribu que más reconocimientos tenga entre los candidatos a serlo. 
-}

hallarElegido :: Tribu -> Fremen
hallarElegido tribu = foldl1 (compararReconocimientos) (filter puedeSerElegido tribu)

-- FUNCIONES AUXILIARES

compararReconocimientos :: Fremen -> Fremen -> Fremen
compararReconocimientos fremen1 fremen2
    | reconocimientos fremen1 > reconocimientos fremen2 = fremen1
    | otherwise = fremen2

puedeSerElegido :: Fremen -> Bool
puedeSerElegido fremen1 = elem "Domador" (titulos fremen1) && tolerancia fremen1 > 100

agregarReconocimiento :: Fremen -> Int -> Fremen
agregarReconocimiento fremen1 nroReco = fremen1 { reconocimientos = reconocimientos fremen1 + nroReco }

{- 
    PARTE 2 

    Obtener la lista de crías que surge de aparear dos listas de gusanos, uno a uno. En caso que un gusano no tenga con qué otro gusano aparearse, 
    obviamente no hay cría. Por ejemplo, el primero de la primera lista con el primero de la segunda lista, los segundos entre sí y así sucesivamente.
-}

data Gusano = UnGusano {
    longitud :: Float,
    nivelHidratacion :: Int,
    descripcion :: String
}deriving (Show, Eq)

-- GUSANOS DE EJEMPLO

gusano1 :: Gusano
gusano1 = UnGusano 10 5 "Rojo con lunares"

gusano2 :: Gusano
gusano2 = UnGusano 8 1 "Dientes puntiagudos"

gusano3 :: Gusano
gusano3 = UnGusano 35 2 "Gordo"

gusano4 :: Gusano
gusano4 = UnGusano 20 3 "Largo"

gusano5 :: Gusano
gusano5 = UnGusano 15 4 "Verde"

gusano6 :: Gusano
gusano6 = UnGusano 1000 6 "Amarillo"

-- LISTAS DE GUSANOS DE EJEMPLO

lista1 :: [Gusano]
lista1 = [gusano1, gusano2]

lista2 :: [Gusano]
lista2 = [gusano3, gusano4, gusano5]

reproduccionDeGusanos :: Gusano -> Gusano -> Gusano
reproduccionDeGusanos gusano1 gusano2 = UnGusano (0.1 * max (longitud gusano1) (longitud gusano2)) 0 (descripcion gusano1 ++ " - " ++ descripcion gusano2)

listaDeCrias :: [Gusano] -> [Gusano] -> [Gusano]
listaDeCrias gusanos1 gusanos2 = 
  foldr (\(g1, g2) acc -> reproduccionDeGusanos g1 g2 : acc) [] (zip gusanos1 gusanos2)

{-
    PARTE 3

    Domar gusano de arena: Un Fremen puede domar a un gusano de arena si su nivel de tolerancia a la Especia es al menos la mitad de la longitud del gusano.
    Al hacerlo, obtiene el título de "Domador" y su tolerancia a la especia aumenta en 100 unidades. Si no lo puede hacer su tolerancia a la Especia baja un 10%. 

    Destruir gusano de arena: Un Fremen puede destruir a un gusano de arena si tiene el título de "Domador" y si su nivel de tolerancia a la Especia es menor la mitad de la longitud del gusano.
    Al hacerlo, recibe un reconocimiento y su tolerancia a la especia aumenta en 100 unidades. Si no lo logra, su especia baja un 20%. 

    Inventada: Inventar otra misión que un Fremen pueda hacer con un gusano, que también se pueda realizar dependiendo de cómo
     sea el gusano en relación al Fremen y que provoque consecuencias diferentes sobre el Fremen si lo logra o no.

    Se pide:

    Simular la realización colectiva de una misión: Dada una tribu, una misión cualquiera y un gusano de arena, 
    hacer que cada uno de los Fremen de la tribu intenten llevar a cabo la misión con dicho gusano, obteniendo cómo queda la tribu en consecuencia.

    Averiguar, para una tribu, una misión y un gusano, si el hecho de realizarla colectivamente haría 
    que el elegido de la tribu fuera un Fremen diferente al que hubieran elegido previamente.
-}

domarGusanoDeArena :: Fremen -> Gusano -> Fremen
domarGusanoDeArena fremen gusano 
    | tolerancia fremen >= ((longitud gusano) * 0.5) = fremen { tolerancia = tolerancia fremen + 100, titulos = titulos fremen ++ ["Domador"]  }
    | otherwise = fremen { tolerancia = tolerancia fremen - (tolerancia fremen * 0.1) } 

--pruebo por terminal: domarGusanoDeArena stilgar gusano2 ---devuelve--- UnFremen {nombre = "Stilgar", tolerancia = 250.0, titulos = ["Gu\237a","Fachero","habiidoso","Domador"], reconocimientos = 3}

destruirGusanoDeArena :: Fremen -> Gusano -> Fremen
destruirGusanoDeArena fremen gusano 
    | elem "Domador" (titulos fremen) && tolerancia fremen < ((longitud gusano) * 0.5) = fremen { tolerancia = tolerancia fremen + 100, reconocimientos = reconocimientos fremen + 1 }
    | otherwise = fremen { tolerancia = tolerancia fremen - (tolerancia fremen * 0.2) }

--pruebo por terminal: destruirGusanoDeArena juan gusano6 ---devuelve--- UnFremen {nombre = "Juan", tolerancia = 190.0, titulos = ["Domador","Fachero"], reconocimientos = 6}

decapitarGusanoDeArena :: Fremen -> Gusano -> Fremen
decapitarGusanoDeArena fremen gusano 
    | elem "Fachero" (titulos fremen) && (reconocimientos fremen == nivelHidratacion gusano) = fremen { tolerancia = tolerancia fremen + 1000, titulos = titulos fremen ++ ["Experto en decapitaciones"]}
    | otherwise = fremen { titulos = titulos fremen ++ ["Fracasado"] }

--pruebo por terminal: decapitarGusanoDeArena juan gusano1 ---devuelve--- UnFremen {nombre = "Juan", tolerancia = 1090.0, titulos = ["Domador","Fachero","Decapitador Fachero"], reconocimientos = 5}

type Mision = Fremen -> Gusano -> Fremen

simularMision :: Tribu -> Mision -> Gusano -> Tribu
simularMision tribu mision gusano = map (\fremen -> mision fremen gusano) tribu

-- lo pruebo por terminal: simularMision tribu2 decapitarGusanoDeArena gusano1
---devuelve--- [UnFremen {nombre = "Gonza", tolerancia = 150.0, titulos = ["Domador","Aburrido","Ruidoso","Oloroso","Fracasado"], reconocimientos = 1},UnFremen {nombre = "Marcelo", tolerancia = 120.0, titulos = ["Domador","Fracasado"], reconocimientos = 2},UnFremen {nombre = "Juan", tolerancia = 1090.0, titulos = ["Domador","Fachero","Experto en decapitaciones"], reconocimientos = 5}]


-- Averiguar, para una tribu, una misión y un gusano, si el hecho de realizarla colectivamente haría que el elegido de la tribu fuera un Fremen diferente al que hubieran elegido previamente.

cambiaElegido :: Tribu -> Mision -> Gusano -> Bool
cambiaElegido tribu mision gusano = ((hallarElegido tribu /=) . hallarElegido) (simularMision tribu mision gusano)

-- lo pruebo por terminal: cambiaElegido tribu2 decapitarGusanoDeArena gusano1 ---devuelve--- True


-- PARTE 4

{-
    Qué pasaría con una tribu de infinitos Fremen?

    a) Al simular un mision:
    
    La funcion de simularMision procesa uno por uno cada Fremen (simulandole la mision de forma individual) y devuelve una tribu nueva. Si usase una tribu infinita la funcion estaria repitiendo el proceso  infinitamente y nunca terminaria de ejecutarse, en cambio si lo que modificamos fuese unicamente cosas como el reconocimiento o los titulos u otros valores de ese estilo en fomra cojunta (a todos los fremen de la tribu) entonces si se podria usar infinitamente.

    b) Al querer saber si hay algún candidato a ser elegido:

    Depende, si plantee la funcion para que se detenga al encontrar una cantidad "x" de candidatos, entonces si podria usarse una tribu infinita, pero si la funcion necesita ir fremen por fremen de la tribu para encontrar todos los candidatos y luego determinar cual es el elegido, entonces en este caso no podria usarse una tribu infinita ya que tendria infinitos candidatos.

    c) Al encontrar al elegido:

    Este caso esta directamente relacionado con el b) ya que si tengo una lista de infinitos candidatos y debo compraralos uno por uno, nunca se terminara de ejecutar la funcion, a diferencia del punto anterior, si la tribu es infinita esto no seria posible ya que solo puede haber un elegido por lo que al no poder terminar de procesar los candidatos (porque son infinitos) no puedo elegir uno.
-}
