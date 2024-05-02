
data Ciudad = UnaCiudad{
    nombre :: String,
    fundacion :: Float,
    atracciones :: [String],
    costoDeVida :: Float
}deriving(Show, Eq)

--PARTE 1
baradero :: Ciudad
baradero = UnaCiudad "Baradero" 1615 ["Parque del Este","Museo Alejandro Barbich"] 150
nullish :: Ciudad
nullish = UnaCiudad "Nullish" 1800 [] 140
caleta :: Ciudad
caleta = UnaCiudad "Caleta Olivia" 1901 ["El Gorosito","Faro Costanera"] 120
maipu :: Ciudad
maipu = UnaCiudad "Maipú" 1878 ["Fortín Kakel"] 115
azul :: Ciudad
azul = UnaCiudad "Azul" 1832 ["Teatro Español", "Parque Municipal Sarmiento", "Costanera Cacique Catriel"] 190

valorCiudad :: Ciudad -> Float
valorCiudad ciudad
                | fundacion ciudad < 1800 = 5 * (1800 - fundacion ciudad)
                | null (atracciones ciudad) = 2 * costoDeVida ciudad
                | otherwise = 3 * costoDeVida ciudad

--PARTE 2
atraccionCopada :: Ciudad -> Bool
atraccionCopada ciudad = any vocal (atracciones ciudad)

vocal :: String -> Bool
vocal lugar = head lugar `elem` "aeiouAEIOU"

ciudadSobria :: Ciudad -> Int -> Bool
ciudadSobria ciudad x = not (null (atracciones ciudad)) && all (letras x) (atracciones ciudad)

letras :: Int -> String -> Bool
letras x lugar = length lugar > x

ciudadNombreRaro :: Ciudad -> Bool
ciudadNombreRaro ciudad = length (nombre ciudad) < 5

--PARTE 3
sumarAtraccion :: Ciudad -> String -> Ciudad
sumarAtraccion ciudad nuevaAtraccion = ciudad{atracciones = atracciones ciudad ++ [nuevaAtraccion], costoDeVida = costoDeVida ciudad * 1.2}

crisisCiudad :: Ciudad -> Ciudad
crisisCiudad ciudad
    | null (atracciones ciudad) = ciudad{costoDeVida = costoDeVida ciudad - costoDeVida ciudad * 0.1}
    | otherwise = ciudad{atracciones = init (atracciones ciudad), costoDeVida = costoDeVida ciudad - costoDeVida ciudad * 0.1}

remodelarCiudad :: Ciudad -> Float -> Ciudad
remodelarCiudad ciudad porcentaje = ciudad{costoDeVida = costoDeVida ciudad * (porcentaje/100 + 1), nombre = "New " ++ nombre ciudad}

reevaluacionCiudad :: Ciudad -> Int -> Ciudad
reevaluacionCiudad ciudad n
    | ciudadSobria ciudad n = ciudad{costoDeVida = costoDeVida ciudad * 1.1}
    | otherwise = ciudad{costoDeVida = costoDeVida ciudad - 3}

--PARTE 4
transformacion :: Ciudad -> Float -> Int -> Ciudad
transformacion ciudad porcentaje n = reevaluacionCiudad (crisisCiudad (remodelarCiudad ciudad porcentaje)) n
--tranformacion ciudad porcentaje n = revaluacionCiudad letras.crisisCiudad.remodelarCiudad porcenaje n

--transformacion letras ciudad = reevaluacion letras (crisis (remodelacion ciudad))
--transformacion letras cantidad = reevaluacion  letras . crisis . remodelacion cantidad

type Evento = String

data Anio = UnAnio {
    numero :: Int,
    eventos :: [Evento]
}



--reflejarAnio :: Int -> [Evento] -> Ciudad
--reflejarAnio 