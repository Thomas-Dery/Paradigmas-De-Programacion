
data Auto = UnAuto {
    color :: String,
    velocidad :: Int,
    distancia :: Int
}deriving (Show, Eq)

type Carrera = [Auto]

carrera1 :: Carrera
carrera1 = [UnAuto "Rojo" 100 0, UnAuto "Azul" 120 0, UnAuto "Verde" 80 0]

carrera2 :: Carrera
carrera2 = [UnAuto "Rojo" 300 70, UnAuto "Azul" 50 100, UnAuto "Verde" 67 10]



-- Punto 1
listaDistancias :: [Auto] -> [Int]
listaDistancias = map distancia

maximaDistancia :: Carrera -> Int
maximaDistancia = maximum . listaDistancias

estaCerca :: Auto -> Auto -> Bool
estaCerca auto1 auto2 = (abs (distancia auto1 - distancia auto2) < 10) && (auto1 /= auto2)

vaTranquilo :: Auto -> Carrera -> Bool
vaTranquilo auto1 carrera = all (not . estaCerca auto1) carrera && (distancia auto1 == maximaDistancia carrera)

puesto :: Auto -> Carrera -> Int
puesto auto1 carrera = length (filter (\auto2 -> distancia auto1 < distancia auto2) carrera) + 1

-- Punto 2

correrDuranteCiertoTiempo :: Auto -> Int -> Auto
correrDuranteCiertoTiempo auto1 tiempo = auto1{distancia = (tiempo * velocidad auto1) + distancia auto1}

alterarVelocidad :: (Int -> Int) -> Auto -> Auto
alterarVelocidad modificador auto = auto { velocidad = max 0 (modificador (velocidad auto)) }

bajarVelocidad :: Auto -> Int -> Auto
bajarVelocidad auto reduccion = alterarVelocidad (\velocidad -> velocidad - reduccion) auto

-- Punto 3

afectarALosQueCumplen :: (a -> Bool) -> (a -> a) -> [a] -> [a] 
afectarALosQueCumplen condicion efecto lista = map (efectoCumpleCriterio condicion efecto) lista

efectoCumpleCriterio :: (a -> Bool) -> (a -> a) -> a -> a
efectoCumpleCriterio criterio efecto x
  | criterio x = efecto x
  | otherwise = x

terremoto :: Auto -> [Auto] -> [Auto]
terremoto auto1 carrera = afectarALosQueCumplen (estaCerca auto1) (\auto -> bajarVelocidad auto 50) carrera

miguelitos :: Auto -> Int -> [Auto] -> [Auto]
miguelitos auto1 reduVel carrera = afectarALosQueCumplen (puesto auto1) (bajarVelocidad reduVel) carrera