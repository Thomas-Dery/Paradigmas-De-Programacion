object gandalf {
  var property vida = 100
  var poderPersonaje = 0

  method getPoder() = poderPersonaje
  method setPoder(){
    if(vida < 10){
      poderPersonaje = vida * 300 + (armas.sum({unArma => unArma.getPoder()})) * 2
    }
    else{
      poderPersonaje = vida * 15 + (armas.sum({unArma => unArma.getPoder()})) * 2
    }
  }

  method cambiarVida(num) {
    vida += num
  }

  const armas = []

  method getArmas() = armas 

  method agregarArma(arma) {
    armas.add(arma)
  }

  //method puedePasarCamino(camino) = (camino.getCamino().first()).condicionPasar(self) && (camino.getCamino().last()).condicionPasar(self)
  method puedePasarCamino(camino) = camino.getCamino().all{camino => camino.condicionPasar(self)}

  method recorrerCamino(camino) {
    if(self.puedePasarCamino(camino)){
      // (camino.getCamino().first()).recorrer(self)
      // (camino.getCamino().last()).recorrer(self)
      var acum = self
      camino.getCamino().fold(self, {acum, lugar => lugar.recorrer(acum)})
    }
  }
}


object baculo {
  const poderArma = 400

  method getPoder() = poderArma
  method setPoder() {
    
  }
}

object espadaElfica {
  var poderArma = 0

  method getPoder() = poderArma
  method setPoder() {
    poderArma = 10 * 25
  }
}

object espadaEnana {
  var poderArma = 0

  method getPoder() = poderArma
  method setPoder() {
    poderArma = 10 * 20
  }
}

object espadaHumana {
  var poderArma = 0

  method getPoder() = poderArma
  method setPoder() {
    poderArma = 10 * 15
  }
}

object lebennin {
  method condicionPasar(personaje) = personaje.getPoder() > 1500

  method recorrer(personaje) {
    
  }
}

object minasTirith {
  method condicionPasar(personaje) = personaje.getArmas().size() > 0

  method recorrer(personaje) {
    personaje.cambiarVida(-10)
  }
}

object lossarnach {
  method condicionPasar(personaje) = true

  method recorrer(personaje) {
    personaje.cambiarVida(1)
  }
}

object gondor {
  var camino = [lebennin, minasTirith]

  method getCamino() = camino

  method cambiarInicio(inicio) {
    camino.remove(camino.first())
    camino = [inicio] + camino
  }
  method cambiarFinal(final) {
    camino.remove(camino.last())
    camino.add(final)
  }
  /*method cambiarCamino(inicio, final) {
    caminoGondor.clear()
    caminoGondor.add(inicio)
    caminoGondor.add(final)
  }*/
}

object tomBombadil {
  const property vida = 100
  const poderPersonaje = 2000

  method getPoder() = poderPersonaje 

  method cambiarVida(num) {
    
  }

  const armas = [armaDesconocida]

  method getArmas() = armas

  //method puedePasarCamino(camino) = (camino.getCamino().first()).condicionPasar(self) && (camino.getCamino().last()).condicionPasar(self)
  method puedePasarCamino(camino) = camino.getCamino().all{camino => camino.condicionPasar(self)}
  
  method recorrerCamino(camino) {
    if(self.puedePasarCamino(camino)){
      // (camino.getCamino().first()).recorrer(self)
      // (camino.getCamino().last()).recorrer(self)
      var acum = self
      camino.getCamino().fold(self, {acum, lugar => lugar.recorrer(acum)})
    }
  }
}

object armaDesconocida {
  const poderArma = 0

  method getPoder() = poderArma
  method setPoder() {
    
  }
}