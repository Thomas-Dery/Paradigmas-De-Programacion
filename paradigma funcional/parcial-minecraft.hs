
data Personaje = UnPersonaje {
	nombre:: String,
	puntaje:: Int,
	inventario:: [Material]
} deriving Show

type Material = String

data Receta = Receta {
    materiales :: [Material],
    tiempo :: Int,
    resultado :: Material
}

fogata,fosforo, madera,polloAsado,pollo,sueter,hielo,lobos,iglues :: Material
fogata = "fogata"
fosforo = "fosforo"
madera = "madera"
pollo = "pollo"
polloAsado = "pollo asado"
sueter = "sueter"
hielo = "hielo"
iglues = "iglues"
lobos = "lobos"

intentarCrafteo :: Personaje -> Receta -> Personaje
intentarCrafteo jugador receta tiempo
	| 
	| otherwise = jugador {puntaje = puntaje jugador - 100}



-- auxiliares

tieneMaterialesNecesarios :: Personaje -> Receta -> Bool
tieneMaterialesNecesarios jugador receta = all (\material -> elem material (inventario jugador)) (materiales receta)

agregarMaterial jugador material 
    | tieneObjetosNecesarios jugador material == False = jugador {inventario = inventario jugador ++ material} 
    | otherwise = jugador

eliminarMaterial jugador material = jugador {inventario = filter (/= material) (inventario jugador)}
-- Craftear consiste en construir objetos a partir de otros objetos. Para ello se cuenta con recetas que consisten en una lista de materiales que se requieren para craftear un nuevo objeto. En ninguna receta hace falta más de una unidad de mismo material. La receta también especifica el tiempo que tarda en construirse. Todo material puede ser componente de una receta y todo objeto resultante de una receta también es un material y puede ser parte en la receta de otro.
-- El jugador debe quedar con el nuevo objeto en su inventario
-- El jugador debe quedar sin los materiales usados para craftear
-- La cantidad de puntos del jugador se incrementa a razón de 10 puntos por segundo utilizado en el crafteo.
-- El objeto se craftea sólo si se cuenta con todos los materiales requeridos antes de comenzar la tarea. En caso contrario, no se altera el inventario, pero se pierden 100 puntos.
-- Por ejemplo, si un jugador con 1000 puntos tenía un sueter, una fogata y dos pollos y craftea un pollo asado, mantiene su sueter intacto, se queda con un sólo pollo, sin fogatas y pasa a tener un pollo asado en su inventario. Su puntaje pasa a ser 4000.

