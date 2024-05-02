
porCargo :: String -> Int

porCargo "titular" = 149000
porCargo "adjunto" = 116000
porCargo "ayudante" = 66000


porAntiguedad :: Int -> String -> Int

porAntiguedad x y 

 | 3 <= x && x <= 5 = (porCargo y `div` 100) * 20
 | 5 < x && x <= 10 = (porCargo y `div` 100) * 30
 | 10 < x && x <= 24 = (porCargo y `div` 100) * 50
 | x > 24 = (porCargo y `div` 100) * 120
 | otherwise = porCargo y

porHoras :: Int -> String -> Int

porHoras horasTrabajadas z 

 | 15 <= horasTrabajadas && horasTrabajadas <= 24 = (porCargo z * 2)
 | 25 <= horasTrabajadas && horasTrabajadas <= 34 = (porCargo z * 3) 
 | 35 <= horasTrabajadas && horasTrabajadas <= 44 = (porCargo z * 4)
 | 45 <= horasTrabajadas && horasTrabajadas <= 50 = (porCargo z * 5)
 | otherwise = horasTrabajadas * 1

sueldoFinal :: String -> Int -> Int -> Int
sueldoFinal cargo antiguedad horasTrabajadas = porAntiguedad antiguedad cargo + porHoras horasTrabajadas cargo

{- 

otra forma de hacer lo de las guardas

sueldoDocente cargo anios tiempo = basico cargo * antiguedad anios * horas tiempo

basico "titular" = 149000
basico "adjunto" = 116000
basico "ayudante" = 66000

antiguedad anios

 | anios >= 24 = 2.2
 | anios >= 10 = 1.5
 | anios >= 5 = 1.3
 | anios >= 3 = 1.2
 | otherwise = 1 


-}

