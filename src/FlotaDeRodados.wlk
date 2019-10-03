import wollok.game.*

class Region{
	var property x = []
	var property y = []
	method tamanio(x1,x2,y1,y2){
		x =[ x1 ..x2]
		y = [y1 .. y2]
		
	
	}
}

class ChevroletCorsa {
	var property position = new Position (x=0,y=0)
	var property historialDeMovimientos = []
	var property color						////////////
	var ultimoMovimiento = null
	var ListaPosiciones = []

	method capacidad(){
		return 4
	}
	method velocidadMaxima(){
		return 150
	}
	method peso(){
		return 1300
	}
	
	method moverHacia(direccion){
        position = direccion.nuevaDireccion(position)
        ultimoMovimiento= direccion
        ListaPosiciones.add(direccion)
    }
    
	/*method moverHacia(dir){
		ultimoMovimiento = dir
		if(dir==norte){
			self.position(position.up(1))
		}
		else if(dir==sur){
			self.position(position.down(1))
		}
		else if(dir==oeste){
			self.position(position.left(1))
		}
		else if(dir==este){
			self.position(position.right(1))
		}
		historialDeMovimientos.add(position)
	}
	* 
	*/
	method repetirUltimoMovimiento(){
		self.moverHacia(ultimoMovimiento)
	}
	method pasoPor(posicion){
		historialDeMovimientos.any({pos=>pos == posicion})
	}
	method estaEn(region){
		region.x().contains(self.x()) and region.y().contains(self.y())
	
	
}

class RenaultKwid{
	var property tanqueAdicional			////////
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

class AutoEspecial{
	var property peso
	var property velocidadMaxima
	var property capacidad
	var property color
}

class FlotaDeRodados{
	var property empleados										/////
	var property flota = []
	var resultado = null
	var pedidos = []
	
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
	/////////ETAPA3///////////
	

	method agregarPedido(ped){
		pedidos.add(ped)
	}
	method quitarPedido(ped){
		pedidos.remove(ped)
	}
	method totalPasajerosEnPedidos(){
		return pedidos.sum({pedido=>pedido.cantidadDePasajeros()})
	}
	method satifacePedido(auto){
		return pedidos.any({pd => pd.puedeSatifacerPedido(auto)})
	}
	method cualNoSatifacePedido(){
		return flota.filter({auto=> pedidos.any({pd => not pd.puedeSatifacerPedido(auto)})	})
	}
}


class Pedido{
	var property distanciaARecorrer //KMS
	var property tiempoMaximo //HrS
	var property cantidadDePasajeros
	var property coloresIncompatibles = []
	method velocidadRequerida(){
		return distanciaARecorrer / tiempoMaximo
	}
	method puedeSatifacerPedido(auto){
		
		return auto.velocidadMaxima()+10 >= self.velocidadRequerida() and auto.capacidad()>=cantidadDePasajeros and not coloresIncompatibles.any({pd => pd == auto.color()})
	}
	method acelerar(){
		tiempoMaximo =-1
	}
	method relajar(){
		tiempoMaximo =+ 1
	}
}







//AUX
object rojo{}
object verde{}
object blanco {}
object azul {}
object beige{}

object norte{
	method mueveDireccion(direccion){
		return direccion.up(1)
	}
}
object oeste{
	method mueveDireccion(direccion){
		return direccion.left(1)
	}
}
object este{
	method mueveDireccion(direccion){
		return direccion.right(1)
	}
}
object sur{
	method mueveDireccion(direccion){
		return direccion.down(1)
	}
}
object negro{
}


