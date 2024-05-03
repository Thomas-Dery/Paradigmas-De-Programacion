
data Torneo = UnTorneo {
    participantes :: [Equipo]
} 

data Equipo = UnEquipo {
    nombre :: String,
    puntos :: Int
    --goles :: Int
} deriving Show

lpf :: Torneo
lpf = UnTorneo [boca, velez, racing, river]

river :: Equipo
river = UnEquipo "river" 9
boca :: Equipo
boca = UnEquipo "boca" 5
velez :: Equipo
velez = UnEquipo "velez" 1
racing :: Equipo
racing = UnEquipo "racing" 4
chacarita ::Equipo
chacarita = UnEquipo "chacarita" 0

ganadorTorneo :: Torneo -> Equipo
ganadorTorneo torneo = foldr compararPuntos chacarita (participantes torneo)

compararPuntos :: Equipo -> Equipo -> Equipo
compararPuntos equipo1 equipo2 
    | puntos equipo1 < puntos equipo2 = equipo2
    | puntos equipo1 >= puntos equipo2 = equipo1



