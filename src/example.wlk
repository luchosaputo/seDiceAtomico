object springfield {
	var viento = 10
	var riquezaSuelo = 0.9
	var centrales = [centralAtomica, centralCarbon, centralEolica]
	var necesidad = 5
	method viento() {
		return viento
	}
	method riquezaSuelo() {
		return riquezaSuelo
	}
	method centralesContaminantes() {
	return	centrales.filter({unaCentral => unaCentral.contaminacion()})
	}
	method cubrioSuNecesidad(){
		return centrales.fold(0, {suma, unaCentral => suma + unaCentral.produccion(self)}) >= necesidad
	}
	method contaminantesAportanMucho() {
		return self.centralesContaminantes().sum({unaCentral =>unaCentral.produccion(self)}) / necesidad >= 0.5
	}
	method estaAlHorno() {
		return self.centralesContaminantes() == centrales || self.contaminantesAportanMucho()
	}
	
}
	
object centralAtomica {
	var varillas = 30
	method produccion(_){
		return 0.1 * varillas	
	}	
	method contaminacion() {
		return varillas > 20
	}
}

object centralCarbon {
	var capacidad = 10
	method produccion(ciudad) {
		return + capacidad * ciudad.riquezaSuelo() 
	}
	method contaminacion() {
		return true
	}	
}

object turbina {
	var produccion = 0.2 
	method produccion(ciudad){
		return produccion*ciudad.viento()
	}
}

object centralEolica {
	var turbinas = [turbina]
	var ciudad = springfield
	method produccion(_){
		return turbinas.fold(0, {suma, unaTurbina => suma + unaTurbina.produccion(ciudad)})
	}
	method contaminacion(){
		return false
	}
}











