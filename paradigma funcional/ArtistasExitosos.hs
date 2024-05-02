
type Cancion = String

data Artista = UnArtista {
    nombre :: String,
    canciones :: [Cancion]
} deriving Show

fitito :: Artista
fitito = UnArtista "Fitito Paez" ["11 y 6", "El amor despues del amor", "Mariposa Tecknicolor"]

calamardo :: Artista
calamardo = UnArtista "Andres Calamardo" ["Flaca", "Sin Documentos", "Tuyo siempre"]

paty :: Artista
paty = UnArtista "Taylor Paty" ["Shake It Off", "Lover"]


-- Saber la calificacion de un canción, que equivale a la cantidad de letras 
-- minúsculas (sin espacios, números ni caracteres especiales) de la canción, más 10

calificacionCancion :: Cancion -> Int
calificacionCancion cancion = length (filter (\c -> c `elem` ['a'..'z']) cancion) + 10

esExitoso :: Artista -> Bool
esExitoso artista = sum (filter (>20) (map calificacionCancion (canciones artista))) > 50

artistasExitosos :: [Artista] -> [String]
artistasExitosos artista = map nombre (filter esExitoso artista)