object cartaPicachu {
  method valor() = 10
  
  method revalorizar() {
    
    // NO SE RELVALORIZA LA CARA DE PICACHU,
  }
}

object cartaYughiOh {
  var valor = 100
  
  method valor() = valor
  
  method revalorizar() {
    valor *= 2
  }
}

object anchoDeEspadas {
  var antiguedad = 100
  
  method valor() = antiguedad * 7
  
  method revalorizar() {
    antiguedad += 1
  }
}

object juanCruz {
  const cartas = []
  var dinero = 0
  
  method conseguirCarta(unaCarta) {
    cartas.add(unaCarta) // AGREGA UN ELEMENTO A LA LISTA
  }
  
  method tieneCarta(unaCarta) = cartas.contains(unaCarta)
  
  method vender() {
    dinero += cartas.first().valor() // VENDE EL PRIMER ELEMENTO DE LA LISTA
    cartas.remove(cartas.first())
  }
  
  method cuantaPlataTienes() = dinero
  
  method cuantasCartas() = cartas.size()
  
  method cotizacion() = cartas.sum({ cartas => cartas.valor() })
  // EL BLOQUE TIENE UN PARAMETRO. "CARTA" ES CADA ELEMENTO DE LA LISTA, DEVUELVE NRO
  
  method tieneAlgunaCartaMuyValiosa() = cartas.any(
    { carta => carta.valor() > 200 }
  )
  
  method lasCartasMuyValiosas() = cartas.filter(
    { carta => carta.valor() > 200 }
  ) // DEVUELVE LISTA DE LAS CARTAS MAS VALIOSAS
  
  method listaDeValores() = cartas.map({ carta => carta.valor() })
  // LISTA DE LOS VALORES DE LAS CARTAS DE LA COLECCION
  
  method nn() = cartas.max({ carta => carta.valor() }) // CARTA DE MAYOR VALOR
  
  method visitarExperto() {
    cartas.forEach({ carta => carta.revalorizar() })
    // NO RETORNA NADA, Y A CADA ELEMENTO DE LA LISTA EL APLICA LO QUE LE INDICO
  }

 
}