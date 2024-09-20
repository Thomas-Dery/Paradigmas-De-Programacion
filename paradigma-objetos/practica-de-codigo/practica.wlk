class Luchador {
  var vida
  var fuerza
  var dinero = 0
  
  method inicializar(unaVida, unaFuerza, unDinero) {
    vida = unaVida
    fuerza = unaFuerza
    dinero = unDinero
  }
  
  method getVida() = vida
  
  method setVida(unaVida) {
    vida += unaVida
  }
  
  method getFuerza() = fuerza
  
  method setFuerza(unaFuerza) {
    fuerza += unaFuerza
  }
  
  method getDinero() = dinero
  
  method setDinero(unDinero) {
    dinero += unDinero
  }
  
  method ganaElCombate(luchador2) {
    if (self.getFuerza() > luchador2.getFuerza()) {
      return true
    } else {
      return false
    }
  }
}
// const Messi = new Luchador(vida = 100, fuerza = 55, dinero = 105)// const Messi = new Luchador(vida = 100, fuerza = 55, dinero = 105)


Luchador Messi = new Luchador(100, 55, 0)
Luchador Cristiano = new Luchador(100, 40, 0)