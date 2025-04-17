import cosas.* 
import cuentasBancarias.*
object casaDePepeYJulian {
    const cosas = []
    var property cuentaSeleccionada = corriente

    method comprar(cosa) {
        if (self.puedeComprar(cosa)) {
            cosas.add(cosa)
            cuentaSeleccionada.extraer(cosa.precio())
        } else {
            self.error("no se puede comprar, saldo insuficiente.")
        }
    }

    method puedeComprar(cosa) {
        const cuenta = conGastos
        return cuentaSeleccionada == cuenta || cosa.precio() <= cuentaSeleccionada.saldo()
    }

    method saldoCuentaSeleccionada() {
        return cuentaSeleccionada.saldo()
    }

    method cantidadDeCosasCompradas() {
        return cosas.size()
    }

    method tieneAlgun(categoria) {
        return cosas.any({
            cosa => cosa.categoria() == categoria
        })
    } 

    method vieneDeComprar(categoria) {
        return if (cosas.isEmpty()) {
            self.error("todavía no se compró nada :(")
        } else {
            cosas.last().categoria() == categoria
        }
    } 

    method esDerrochona() {
        return self.importeTotalDeLasCosas() >= 9000
    } 

    method importeTotalDeLasCosas() {
        return cosas.sum({
            cosa => cosa.precio()
        })
    } 

    method compraMasCara() {
        return if (cosas.isEmpty()) {
            self.error("nada is priceless.")
        } else {
            cosas.max({ 
                cosa => cosa.precio()
        })
        }
    }

    method comprados(categoria) {
        return cosas.filter({ 
            cosa => cosa.categoria() == categoria
        })
    }

    method malaEpoca() {
        const categoriaMalaEpoca = comida
        return cosas.all({ 
            cosa => cosa.categoria() == categoriaMalaEpoca
        })
    }

    method queFaltaComprar(lista) {
        return lista.filter({ 
            cosa => ! self.estaComprada(cosa)
        })
    }

    method estaComprada(cosa) {
        return cosas.contains(cosa)
    }

    method faltaComida() {
        return self.cantidadDeComidaComprada().size() < 2
    }

    method cantidadDeComidaComprada() {
        const comidaComprada = comida 
        return cosas.filter({ 
            cosa => cosa.categoria() == comidaComprada
        })
    }

    method categoríasCompradas() {
        return cosas.all({ 
            cosa => cosa.categoria()
        }).asSet()
    }

// ================================================
    method cosas() {
        return cosas
    }

// ##############  EJ 2  ###################


    




    

    
    

    // method ultimaCosaComprada() {
    //     return cosas.last()
    // } 
}
