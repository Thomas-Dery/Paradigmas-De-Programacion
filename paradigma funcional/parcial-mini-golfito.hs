
-- Modelo inicial
data Jugador = UnJugador {
  nombre :: String,
  padre :: String,
  habilidad :: Habilidad
} deriving (Eq, Show)

data Habilidad = Habilidad {
  fuerzaJugador :: Int,
  precisionJugador :: Int
} deriving (Eq, Show)

-- Jugadores de ejemplo
bart = UnJugador "Bart" "Homero" (Habilidad 25 60)
todd = UnJugador "Todd" "Ned" (Habilidad 15 80)
rafa = UnJugador "Rafa" "Gorgory" (Habilidad 10 1)

data Tiro = UnTiro {
  velocidad :: Int,
  precision :: Int,
  altura :: Int
} deriving (Eq, Show)

type Puntos = Int

-- Funciones útiles
-- between n m x = elem x [n .. m]

-- maximoSegun f = foldl1 (mayorSegun f)
-- mayorSegun f a b
--   | f a > f b = a
--   | otherwise = b

-- PARTE 1 

-- Definición de palos
data Palo = Putter | Madera | Hierro Int deriving (Eq, Show)

generarTiro :: Palo -> Habilidad -> Tiro
generarTiro Putter habilidad = UnTiro 10 (2 * precisionJugador habilidad) 0
generarTiro Madera habilidad = UnTiro 100 (precisionJugador habilidad `div` 2) 5
generarTiro (Hierro n) habilidad = UnTiro (fuerzaJugador habilidad * n) (precisionJugador habilidad `div` n) (max 0 (n - 3))

-- para probarlo uso por ejemplo: generarTiro Putter (habilidad bart)

palos :: [Palo]
palos = [Putter, Madera] ++ map Hierro [1..10]


-- tiroPutter :: Habilidad -> Tiro
-- tiroPutter habilidad = UnTiro 10 (precisionJugador habilidad * 2) 0  -- tiroPutter (habilidad bart)

-- tiroMadera :: Habilidad -> Tiro
-- tiroMadera habilidad = UnTiro 100 ((precisionJugador habilidad) `div` 2) 5

-- tiroHierros :: Habilidad -> Int -> Tiro
-- tiroHierros habilidad n = UnTiro (fuerzaJugador habilidad * n) (precisionJugador habilidad `div` n) (n-3)

-- PARTE 2

golpe :: Jugador -> Palo -> Tiro
golpe jugador palo = generarTiro palo (habilidad jugador)

-- PARTE 3