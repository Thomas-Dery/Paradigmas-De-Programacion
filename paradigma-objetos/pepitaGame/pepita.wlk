object pepita {
    var property energia = 100
    var position = game.at(1, 1)
    // var property name =  position = game.at(1, 8)

    method position() = position
    method position(newPos) {
      self.volar(1)
      position = newPos
    }


    method image() = "pepita2.png"
    method estaCansada() = energia < 20

    method volar(metros) {
        energia -= metros * 10
    }

    method comer(comida) {
        energia += comida.energia()
    }

}

object alpiste {
  method image() = "alpiste.png"
  method energia() = 5

  var position = game.at(7, 10)
  method position() = position

}

object manzana {

  method image() = "manzana.png"
  var madurez = 1
  var position = game.at(8, 4)

  method position() = position

  method energiaQueOtorga() {
    return 0.8 * madurez
  }

  method madurar() {
    madurez += 10
  }

  
}