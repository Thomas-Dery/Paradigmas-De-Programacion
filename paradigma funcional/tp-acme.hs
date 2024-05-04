
data Empresa = UnaEmpresa {
    nombre :: String,
    cantEmpleados :: Int
} deriving Show

terminaConLetraMenor :: Empresa -> Empresa
terminaConLetraMenor empresa  
    | last (nombre empresa) < head (nombre empresa) = empresa{cantEmpleados = cantEmpleados empresa + (length (nombre empresa) - 2)}
    | reverse (nombre empresa) == nombre empresa && even (length (nombre empresa)) = empresa{cantEmpleados = cantEmpleados empresa + 2 * (length (nombre empresa))}
    | length (nombre empresa) `mod` 3 == 0 || length (nombre empresa) `mod` 7 == 0 = empresa{cantEmpleados = cantEmpleados empresa + 3}
    | otherwise = empresa


acme :: Empresa
acme = UnaEmpresa "Acme" 10

star :: Empresa
star = UnaEmpresa "star" 0

noxxon :: Empresa
noxxon = UnaEmpresa  "NOXXON" 0

{-
Una empresa abre una cierta cantidad de sucursales y necesita contratar nuevos empleados. La cantidad de empleados para cada sucursal es la misma, y se calcula según el nombre de la empresa, de la siguiente manera:

Si la empresa es "Acme", son 10 empleados.
Si el nombre de la empresa termina con una letra menor que la con que empieza, son tantos empleados como letras intermedias (o sea, el nombre sin considerar la primera y la última letra).
Por ejemplo "star", contrata 2 empleados por sucursal.
Si el nombre es capicúa y tiene cantidad par de letras, los empleados son el doble de la cantidad de letras intermedias.
Por ejemplo, "NOXXON", son 8.
Si la cantidad de letras del nombre es divisible por 3 o por 7, la cantidad de empleados es la cantidad de copas del mundo ganadas por Argentina.
En cualquier otro caso, no se contratan empleados para cada sucursal.

El objetivo final es obtener la cantidad total de empleados que va a contratar una empresa
-}