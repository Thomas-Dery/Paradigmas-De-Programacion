
object gandalf {
    var property vida = 100
    var poderPersonaje = 0

    method getPoder() = poderPersonaje
    method setPoder(){
      poderPersonaje = self.poderPersonaje()
    }

    method cambiarVida(num) {
      vida += num
    }

    const armas = []

    method getArmas() = armas 

    method agregarArma(arma) {
      armas.add(arma)
    }

    method poderPersonaje() {
      if(vida < 10){
        return (vida * 300 + self.poderTotal() * 2)
      }
      else{
        return (vida * 15 + self.poderTotal() * 2)
      }
    }

    method poderTotal() = armas.sum({unArma => unArma.getPoder()})

    method puedePasarCamino(camino) = (camino.getCamino().first()).condicionPasar(self) && (camino.getCamino().last()).condicionPasar(self)

  method recorrerCamino(camino) {
    if(self.puedePasarCamino(camino)){
      (camino.getCamino().first()).recorrer(self)
      (camino.getCamino().last()).recorrer(self)
    }
  }
}

object baculo {
  const poderArma = 400
  method getPoder() = poderArma
}

object espada {
    var origen = null
    var poderArma = 0

    method getPoder() = poderArma
    method setPoder() {
      poderArma = self.poderDependiendoArma()
    }
    
    method setOrigen(nuevoOrigen) {
        origen = nuevoOrigen
    }

    method poderDependiendoArma() {
        if(origen == "elfico"){
            return 10 * 25
        }
        else if(origen == "enano"){
            return 10 * 20
        }
        else if(origen == "humano"){
            return 10 * 15
        }
        else {
            return 0
        }
    }
}

object lebennin {
  method condicionPasar(personaje) = personaje.getPoder() > 1500

  method recorrer(personaje) {
    
  }
}

object minasTirith {
  method condicionPasar(personaje) = personaje.getArmas().size() > 0

  /*method recorrer(personaje) {
    if(personaje != tomBombadil)
    personaje.vida(personaje.vida() - 10
  }*/
  method recorrer(personaje) {
    personaje.cambiarVida(-10)
  }
}

object lossarnach {
  method condicionPasar(personaje) = true

  /*method recorrer(personaje) {
    if(personaje != tomBombadil)
    personaje.vida(personaje.vida() + 1)
  }*/
  method recorrer(personaje) {
    personaje.cambiarVida(1)
  }
}

object gondor {
  var caminoGondor = [lebennin, minasTirith]

  method getCamino() = caminoGondor 

  method cambiarInicio(inicio) {
    caminoGondor.remove(caminoGondor.first())
    caminoGondor = [inicio] + caminoGondor
  }
  method cambiarFinal(final) {
    caminoGondor.remove(caminoGondor.last())
    caminoGondor.add(final)
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

  method puedePasarCamino(camino) = (camino.getCamino().first()).condicionPasar(self) && (camino.getCamino().last()).condicionPasar(self)

  method recorrerCamino(camino) {
    if(self.puedePasarCamino(camino)){
      (camino.getCamino().first()).recorrer(self)
      (camino.getCamino().last()).recorrer(self)
    }
  }
}

object armaDesconocida {
  
}