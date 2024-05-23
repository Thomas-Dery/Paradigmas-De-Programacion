-- module Library where
-- import Data.List
-- import Data.Fixed (Fixed)

-- data Auto = UnAuto{
--   color :: String,
--     distancia :: Number
-- } deriving (Show,Eq)

-- type Carrera = [Auto]

-- -- Ejercicio 1)

-- estaCerca :: Auto -> Auto -> Bool
-- estaCerca auto otroAuto = (abs (distancia auto - distancia otroAuto) < 10) && (auto /= otroAuto)

-- vaTranquilo :: Auto -> Carrera -> Bool
-- vaTranquilo auto carrera = all (not.(estaCerca auto)) carrera && (distancia auto) == maximum (listaDistancias carrera)

-- listaDistancias = map distancia

-- posicionDeUnAuto :: Auto -> Carrera -> Number
-- posicionDeUnAuto auto carrera =  (length carrera) - (length.(filter (not.leGana auto))) carrera + 1

-- leGana :: Auto -> Auto -> Bool
-- leGana otroAuto auto = distancia auto > distancia otroAuto
-- -- Pregunta si Auto le gana a OtroAuto

-- -- Ejercicio 2)

-- correr :: Number -> Auto -> Auto
-- correr tiempo auto = auto{distancia = distancia auto + (tiempo * velocidad auto)}

-- alterarVelocidad :: (Number -> Number) -> Auto -> Auto
-- alterarVelocidad funcion auto = auto{velocidad = max 0 (funcion (velocidad auto))}

-- bajarVelocidad  :: Number -> Auto -> Auto
-- bajarVelocidad numero auto = alterarVelocidad (flip (-) numero) auto


-- -- Ejercicio 3)

-- type PowerUp = Auto -> Carrera -> Carrera

-- terremoto :: PowerUp
-- terremoto auto carrera = afectarALosQueCumplen (estaCerca auto) (bajarVelocidad 50) carrera


-- miguelitos :: Number -> PowerUp
-- miguelitos reduccion auto carrera = afectarALosQueCumplen (leGana auto) (bajarVelocidad reduccion) carrera

-- jetPack :: Number -> PowerUp
-- jetPack tiempo auto carrera = afectarALosQueCumplen (==auto) (cambiosJetPack tiempo) carrera

-- cambiosJetPack :: Number -> Auto -> Auto
-- cambiosJetPack tiempo auto = auto {distancia = distancia (correr tiempo (alterarVelocidad (*2) auto))}

-- afectarALosQueCumplen :: (a -> Bool) -> (a -> a) -> [a] -> [a]
-- afectarALosQueCumplen criterio efecto lista = 
--     map (efectoSiCumpleCriterio criterio efecto) lista

