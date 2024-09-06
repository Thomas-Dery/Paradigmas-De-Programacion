object tom {
	var property energia = 50
	 
	method comer(raton) {
		energia += self.energiaGanadoComiendo(raton)
	}

    method energiaGanadoComiendo(raton) = 12 + raton.peso()
	
	method correr(distancia){
		energia -= self.energiaGastadaEnCorrer(distancia)
	}

    method energiaGastadaEnCorrer(distancia) = distancia / 2
	
	method velocidadMaxima() = 5 + energia / 10

    method puedeComerRaton(distancia) = self.energiaGastadaEnCorrer(distancia) < energia

    method quiereComerRaton(raton, distancia) = self.puedeComerRaton(distancia) && (self.energiaGastadaEnCorrer(distancia)) < (self.energiaGanadoComiendo(raton))
	
}

object jerry {
	var property edad = 2

    method peso() = edad * 20
}

object nibbles {
	method peso() = 35
}