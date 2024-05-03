
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
--atraccionCopada ciudad = any vocal (atracciones ciudad)
--atraccionCopada ciudad = any (\lugar -> head lugar `elem` "aeiouAEIOU") (atracciones ciudad)
atraccionCopada ciudad = any ((`elem` "aeiouAEIOU").head) (atracciones ciudad)

--vocal :: String -> Bool
--vocal lugar = head lugar `elem` "aeiouAEIOU"

ciudadSobria :: Ciudad -> Int -> Bool
--ciudadSobria ciudad x = not (null (atracciones ciudad)) && all (letras x) (atracciones ciudad)
--ciudadSobria ciudad x = not (null (atracciones ciudad)) && all (\lugar -> length lugar > x) (atracciones ciudad)
ciudadSobria ciudad x = not (null (atracciones ciudad)) && all ((>x).length) (atracciones ciudad)

--letras :: Int -> String -> Bool
--letras x lugar = length lugar > x

ciudadNombreRaro :: Ciudad -> Bool
--ciudadNombreRaro ciudad = length (nombre ciudad) < 5
ciudadNombreRaro = (<5).length.nombre

--PARTE 3
costo :: Ciudad -> Float -> Float
costo ciudad porcentaje = costoDeVida ciudad * porcentaje

sumarAtraccion :: String -> Ciudad -> Ciudad
sumarAtraccion nuevaAtraccion ciudad = ciudad{atracciones = nuevaAtraccion : atracciones ciudad , costoDeVida = costo ciudad 1.2}
--sumarAtraccion ciudad nuevaAtraccion = ciudad{atracciones = atracciones ciudad ++ [nuevaAtraccion], costoDeVida = costo ciudad 1.2}

crisisCiudad :: Ciudad -> Ciudad
crisisCiudad ciudad
                | null (atracciones ciudad) = ciudad{costoDeVida = costoDeVida ciudad - costoDeVida ciudad * 0.1}
                | otherwise = ciudad{atracciones = init (atracciones ciudad), costoDeVida = costoDeVida ciudad - costo ciudad 0.1}

remodelarCiudad :: Float -> Ciudad -> Ciudad
remodelarCiudad porcentaje ciudad = ciudad{costoDeVida = costo ciudad (porcentaje/100 + 1), nombre = "New " ++ nombre ciudad}

reevaluacionCiudad :: Int -> Ciudad -> Ciudad
reevaluacionCiudad n ciudad
                    | ciudadSobria ciudad n = ciudad{costoDeVida = costo ciudad 1.1}
                    | otherwise = ciudad{costoDeVida = costoDeVida ciudad - 3}

--PARTE 4
transformacion :: Float -> Int -> Ciudad -> Ciudad
--transformacion porcentaje n ciudad = reevaluacionCiudad n (crisisCiudad (remodelarCiudad porcentaje ciudad))
transformacion porcentaje n = reevaluacionCiudad n.crisisCiudad.remodelarCiudad porcentaje

--CONTINUACION TP
--PARTE 4.1
type Evento = Ciudad -> Ciudad
data Anio = UnAnio{
    num :: Int,
    eventos :: [Evento]
}

anioEj :: Anio
anioEj = UnAnio 2022 [crisisCiudad, remodelarCiudad 5, reevaluacionCiudad 7]
anioAzul :: Anio
anioAzul = UnAnio 2015 []

anioParaRecordar :: Anio -> Ciudad -> Ciudad
anioParaRecordar anio ciudad = foldl (\acc funcion -> funcion acc) ciudad (eventos anio)

--reflejarAnio :: Int -> [Evento] -> Ciudad
--reflejarAnio 


-- algoMejor ciudad comparacion evento = comparacion (evento ciudad) > comparacion ciudad

