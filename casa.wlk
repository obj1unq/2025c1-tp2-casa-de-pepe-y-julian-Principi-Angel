import cosas.* 
import cuentasBancarias.*
object casaDePepeYJulian {
    const property cosas = []
    var property cuentaSeleccionada = conGastos

    method comprar(cosa) {
        self.validarComprar(cosa)
        cosas.add(cosa)
        cuentaSeleccionada.extraer(cosa.precio())
    }

    method validarComprar(cosa) {
        if (! self.puedeComprar(cosa)) {    
            self.error("no se puede comprar, saldo insuficiente en la cuenta corriente.")
        }
    }

    method puedeComprar(cosa) {
        const cuenta = conGastos
        return cuentaSeleccionada == cuenta || cosa.precio() <= self.saldoCuentaSeleccionada()
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
        self.validarQueSeComproAlgo()
        return cosas.last().categoria() == categoria 
    } 

    method validarQueSeComproAlgo() {
        if (self.estaVaciaLaCasa()) {
            self.error("todavía no se compró nada :(")
        }
    }

    method estaVaciaLaCasa() {
        return cosas.isEmpty()
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
        self.validarQueSeComproAlgo()
        return cosas.max({ 
            cosa => cosa.precio()
        })
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
        return self.cantidadDeComidaComprada() < 2
    }

    method cantidadDeComidaComprada() {
        return self.comidasCompradas().size()
    }

    method comidasCompradas() {
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
}
