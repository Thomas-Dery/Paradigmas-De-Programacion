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


