class ArmaFilosa {
  var ataque
  var filo
  var longitud
  
  method getAtaque() = ataque
  
  method setAtaque() {
    ataque = filo * longitud
  }
}

class ArmaContundente {
  var ataque
  var peso
  var poder
  
  method getPoder() = poder
  
  method setPoder() {
    poder = peso
  }
}


class Gladiador {
  var vida = 100
  var destreza
  var ataque
  var defensa
  var armas = []
  var casco
  var escudo

    method armadura(){
        if(escudo) {
            defensa = 5 + (0.1 * destreza)
        }
        else {
            defensa = 10
        }
    }
}

 

const mirmillones = new Gladiador(vida = 100, destreza = 15, ataque = , defensa = )

const dimachaerus = new Gladiador(vida = 100, destreza)