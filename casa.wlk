import cosas.* 

object casaDePepeYJulian {
    const cosas = []

    method comprar(cosa) {
        cosas.add(cosa)
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
    

    




    

    
    

    // method ultimaCosaComprada() {
    //     return cosas.last()
    // } 
}
