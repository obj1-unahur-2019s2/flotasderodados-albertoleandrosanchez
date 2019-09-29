object blanco {}
object azul {}

class ChevroletCorsa {
	
	var property color
	
	method capacidad(){
		return 4
	}
	method velocidadMaxima(){
		return 150
	}
	method peso(){
		return 1300
	}
}

class RenaultKwid{
	var property tanqueAdicional
	method capacidad(){
		if(tanqueAdicional){
			return 4
		}
		else {return 3}
	}
	method velocidadMaxima(){
		if(tanqueAdicional){
			return 120
		}
		else{return 110}
	}
	method peso(){
		if (tanqueAdicional){
			return 1350
		}
		else { return 1200}
	}
	method color(){
		return azul
	}
}

object trafic{
	var property pesoInterior
	var property pasajeros
	var property pesoMotor
	var property velocidadMaxima
	
	method comodo(){
		pesoInterior=700
		pasajeros = 5
	}
	method popular(){
		pesoInterior = 1000
		pasajeros =12
	}
	method motorPulenta(){
		pesoMotor = 800
		velocidadMaxima = 130
	}
	method motorBataton(){
		pesoMotor =500
		velocidadMaxima= 80
	}
	
	method capacidad(){
		return pasajeros
	}
	method peso(){
		return 4000 + pesoInterior + pesoMotor
	}
	method color(){
		return blanco
	}
}

class FlotaDeRodado{
	var property empleados
	var property flota = []
	var resultado
	method agregarAFlota(rodado){
		flota.add(rodado)
	}
	method quitarDeFlota(rodado){
		flota.remove(rodado)
	}
	method estaBienEquipada(){
		return flota.size()>=3 and flota.all({rodado => rodado.velocidadMaxima()> 100})
	}
	method pesoTotalFlota(){
		return flota.sum({rodado=>rodado.peso()})
	}
	method capacidadTotalEnColor(color){
		return flota.filter({rodado => rodado.color() == color}).sum({pd=>pd.capacidad()})
	}
	method colorDelRodadoMaxRapido(){
		return flota.max({pd=>pd.velocidadMaxima()}).color()
	}
	method capacidadTotalDeFlota(){
		return flota.sum({rodado=>rodado.capacidad()})
	}
	method capacidadFaltante(){
		resultado = empleados - self.capacidadTotalDeFlota()
		return resultado.max(0)
	}
	method esGrande(){
		return empleados >= 40 and flota.size() >= 5
	}
}