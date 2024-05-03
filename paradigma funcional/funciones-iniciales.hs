{-

import Control.Monad.RWS (Sum(Sum))
import qualified Main as sum
-}

{-
doble :: Int -> Int
doble x = x + x

triple :: Int -> Int
triple x = x * 5

esCero :: Int -> Bool
esCero 0 = True
esCero x = False

cuadrado :: Float -> Float
cuadrado x = x
f 1 = 1
f 2 = 4


apellido :: String -> String
apellido "juan" = "gonzalez"
apellido "manuel" = "alfonso"
apellido _ = "sin apellido"

-}

{- arrays -}

{-
esCapicua :: String -> Bool
esCapicua palabra = palabra == reverse palabra

esLarga :: [a] -> Bool
esLarga lista = length lista > 100

{-miBotella = unaBotella "negro" 700 False

data botella = unaBotella {color :: String, capacidad :: Int, bombilla :: Bool} -}


-}


{- Ejercicio de ejemplo "Nomus" -}
{-
data Nomu = UnNomu {alas :: Bool, multiBrazos :: Bool, cantOjos :: Int, colorPiel :: String, cantVida :: Float, fuerza :: Float}


categoria nomus
 | f > 10000 = "high-end"
 | f > 3000 = "fuerte"
 | f > 1000 = "comun"
 | otherwise = "pichi"
 where f = fuerza nomus 

puedeVer nomus = cantOjos nomus > 0

entrenar tiempo nomu = UnNomu {
    cantOjos = cantOjos nomu,
    alas = alas nomu,
    fuerza = fuerza nomu,
    multiBrazos = True,
    colorPiel = colorPiel nomu,
    cantVida = cantVida nomu
}
 
-}

{-
map :: (a->b) -> [a] -> [b]  (recibe una funcion y el segundo parametro es una lista, la funcion se lo aplica a cada elemento de la lista)
filter :: (a->Bool) -> [a] -> [a]
all :: (a->Bool) -> [a] -> Bool     
any :: (a->Bool) -> [a] -> Bool     

ejemplos:

map  doble [1,2,3] ---devuelve--- [2,4,6] 
filter even [1,2,3] ---devuelve--- [2] (filtra los pares)
all even [2,3,6] ---devuelve--- False (todos par?)
any even [1,2,4] ---devuelve--- True (encuentra algun par?)
-}
{-
caracteres :: String -> Int
caracteres palabra = length palabra

totalCaracteres :: [String] -> Int
totalCaracteres listaStrings = sum (map caracteres listaStrings )
 
cuantasPalabrasConMasDe3Caracteres :: [String] -> Int
cuantasPalabrasConMasDe3Caracteres listaString = length (filter tieneMasDe3 listaString)

tieneMasDe3 :: String -> Bool
tieneMasDe3 palabra = caracteres palabra > 3 

-}
{-
COMPOSICION DE FUNCIONES:

(.) :: (B -> C) -> (A -> B) -> (A -> C)

Ejemplo:

doble x = 2.x
cuadrado x = x**2
dobleCuadrado x = (doble.cuadrado)

map (doble.cuadrado) [1,2,3,4] ---devuelve--- [2,8,18,32]

filter (even.cuadrado) [1,2,3,4,5,6] ---devuelve--- [2,4,6]

-}

{-
caracteres :: String -> Int
caracteres palabra = length palabra

tieneMasDe3 :: String -> Bool
tieneMasDe3 palabra = caracteres palabra > 3 

totalCaracteres :: [String] -> Int
totalCaracteres listaStrings = sum.(caracteres listaStrings)

cuantasPalabrasConMasDe3Caracteres :: [String] -> Int
cuantasPalabrasConMasDe3Caracteres listaString = length.(filter tieneMasDe3 listaString)

-}

-- f :: Integer -> [Integer]
-- f 0 = []
-- f n = n : f (n - 1)

-- g 0 x = 0
-- g y 0 = y
-- g y x = x + y

-- g 3/0 + 2  ---devuele--- infinito
-- g 0 (3/0) ---devuelve--- 0
-- take 2 (f 50) ---devuelve--- [50,49]
-- (f 0) !! 1000 ---devuelve--- -1000

-- g :: Float -> Float -> Float
-- g 0 x = x
-- g y x = x + y

-- head (msp (2*) [1,2,3,4,5,56,65,5,5,5,5]) ---devuelve--- 2
-- last (msp (2*) [1,2,3,4,5,56,65,5,5,5,5]) ---devuelve--- 10

-- g 0 (g 0 (34 + 4)) ---devuelve--- 38
-- g 0 (g (3/0) (34 + 4)) ---devuelve--- infinito

-- h 0 x = error "es cero" 
-- h y x = x = y

-- ultimo :: [Float] -> Float
-- ultimo [x] = x
-- ultimo (cabeza:cola)
--    | cabeza < 10 = ultimo cola
--    | otherwise = ultimo cola

-- ejemplo: ultimo [5,1,2,3] ---devuelve--- 

-- cuello :: [a] -> [a]
-- cuello (x:xs) = xs ---devuelve--- xs,   ----desarma
-- ejemplo: cuello [1,2,3] ---devuelve--- [2,3]

-- agregar :: a -> [a] -> [a]
-- agregar x xs = x:xs   ---- arma
-- ejemplo: agregar 1 [2,3,4] ---devuelve--- [1,2,3,4]

ff a b [] = b
ff a b(x:xs) = ff a (a b x) xs

-- ejemplo: 

ff2 a b [] = []
ff2 a b (x:xs) = a b (ff2 a x xs)

data Persona = UnaPersona {
    cansancio :: Float,
    nombre :: String
} deriving (Show)

trabajar :: Persona -> Float -> Persona
trabajar alguien trabajo =  alguien{cansancio = cansancio alguien + trabajo}

jose :: Persona
jose = UnaPersona 50 "jose perez"

ana = UnaPersona 80 "ana perez"

-- pruebo, trabajar 10 (trabajar 20 jose) ---devuelve--- UnaPersona {cansancio = 80.0, nombre = "jose perez"}

trabajar2 :: Float -> Persona -> Persona
trabajar2 trabajo alguien = alguien{cansancio = cansancio alguien + trabajo}

-- reflejarAnio :: Int -> [Evento] -> Ciudad
-- reflejarAnio 

-- foldl (++) "" ["hola", "que","tal"] ---devuelve--- "holaquetal"

-- foldl (trabajar) jose  [1,20,31,4]  ---devuelve--- UnaPersona {cansancio = 106, nombre = "jose perez"}

-- foldl1 (+)[1,2,3,4] ---devuelve--- 10 (no tiene valor inicial)

-- foldl1 (max) [1,20,31,4] ---devuelve--- 31

-- foldl1 ganador [estudiantes, boca, velez] --- va comparando, en este caso compara quien gana entre los primeros 2, el ganador de esta comparacion pasa a ser comparado con el siguiente y asi sucesivamente.





