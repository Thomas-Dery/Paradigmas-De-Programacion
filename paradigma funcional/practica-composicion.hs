
doble :: Float -> Float
doble x = 2*x

losDosPrimeros :: [a] -> [a]
losDosPrimeros lista = take 2 lista

losDosPrimerosInvertidos :: [a] -> [a]
--losDosPrimerosInvertidos lista = take 2 (reverse lista) 
losDosPrimerosInvertidos =  ((take 2) . reverse)
--aux nro = (max 10 nro +1) * 5 < 10

{- probar en terminal:

    losDosPrimeros ["hola", "chau", "tal"] ---devuelve--- ["hola", "chau"]
    map (take 2) ["hola", "chau", "tal"] ---devuelve--- ["ho", "ch", "ta"]
    map ((take 2).reverse) ["hola", "chau", "tal"] ---devuelve--- ["ta", "ch"]
    filter (<10) [1..20] ---devuelve--- [1,2,3,....,9]
    filter ((<10).(*5).(+1).(max 10)) [1..20]
    map ((6*).(/2)) [1..20]
    map (\x -> x * 3) [1..20] ---devuelve--- ["3,6,9,...,60"] (multiplos de 3, al multiplicarlo tipo 3.1, 3.2, 3.6)
    map (\x -> (x + 1/x)) [1..20] ---devuelve--- [2.0, 1.5, 1.3333333, 1.25, ...... , 1.055555555...., ...... ]
    any (even) [3,4,5] ---devuelve--- True

    f algo = algo 5
    any f [odd, even, (>5)] ---devuelve--- True
    any (\algo -> algo 5) [odd, even, (>5)]
-}

-- :t any ---> se usa paara ver que devuelve y todo eso

{-

data Perro = UnPerro {
    raza :: String,
    formaDeJugar :: Perro -> Bool
}

sulan = UnPerro "doverman" saludarAlDuenio

-- (formaDeJugar sultan) lassie

-}