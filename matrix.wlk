object neo {
    var energia = 100

    method esElElegido() = true

    method saltar() {
        energia = energia / 2
    }

    method vitalidad() = energia / 10
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method esElElegido() = false

    method saltar(){
        estaCansado = not estaCansado
        vitalidad = (vitalidad - 1).max(0)
    }

    method vitalidad() = vitalidad
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar(){}

}


object nave{
    const  pasajeros  = []
    method subirPasajeros(unPasajero){
        pasajeros.add(unPasajero)
    }

    method bajarPasajeros(unPasajero){
        pasajeros.remove(unPasajero)
    }

    method cantidadDePasajeros() = pasajeros.size()
    method pasajeroConMayorVitalidad(unPasajero) = pasajeros.max({ unPasajero => unPasajero.vitalidad()})
    method estaEquilibrada() = self.pasajeroConMayorVitalidad().vitalidad() <= min*2 
    method elegidoEstaEnLaNave() = pasajeros.any({ unPasajero => unPasajero.esElElegido()})
    method naveChoca() {
        pasajeros.forEach({p => p.saltar() })
        pasajeros.clear()
    }
    method naveAcelera(){
        pasajeros.filter({p=> not p.esElElegido()}).forEach({p => p.saltar() })
    }
}