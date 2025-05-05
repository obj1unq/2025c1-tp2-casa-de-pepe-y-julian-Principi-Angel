import cosas.* 
import cuentasBancarias.*
object casaDePepeYJulian {
    const cosas = []
    var cuenta  = conGastos
    
    method comprar(cosa) {
        cosas.add(cosa)
        cuenta.extraer(cosa.precio())
    }

    method cantidadDeCosasCompradas() {
        return cosas.size()
    }

    method tieneAlgun(categoria) {
        return cosas.any({
            cosa => cosa.esCategoria(categoria)
        })
    } 

    method vieneDeComprar(categoria) {
        return ! self.sinCompras() && self.esUltimaCompraDe(categoria) 
    } 
    
    method sinCompras() {
        return cosas.isEmpty()
    }
    
    method esUltimaCompraDe(categoria) {
        return self.ultimaCompra().esCategoria(categoria)
    }

    method ultimaCompra() {
        return cosas.last()
    }

    method esDerrochona() {
        return self.importeTotalDeLasCosas() >= self.importeLimiteDerroche()
    } 

    method importeTotalDeLasCosas() {
        return cosas.sum({
            cosa => cosa.precio()
        })
    }

    method importeLimiteDerroche() {
        return 9000
    }
 
    method compraMasCara() {
        return cosas.max({ 
            cosa => cosa.precio()
        })
    }

    method comprados(categoria) {
        return cosas.filter({ 
            cosa => cosa.esCategoria(categoria)
        }).asSet()
    }

    method malaEpoca() {
        return cosas.all({ 
            cosa => cosa.esCategoria(self.categoriaDeMalaEpoca())
        })
    }

    method categoriaDeMalaEpoca() {
        return comida
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
        return self.comidasCompradas() < 2
    }

    method comidasCompradas() {
        return cosas.count({ 
            cosa => cosa.esCategoria(comida)
        })
    }

    method cuenta(_cuenta) {
        cuenta = _cuenta
    }

// =========
    method compras() {
        return cosas
    }
}