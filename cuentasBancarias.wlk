import cosas.*
object corriente {
    var saldo = 0
    var configInicial = 0

    method configuracionInicial(monto) {
        self.validarConfigInicial()
        saldo = monto
        configInicial = 1   
    }

    method validarConfigInicial() {
        if (! self.esConfigInicial()) {
            self.error("ya se configuró el saldo inicial, solo se puede una vez")
        }
    }

    method esConfigInicial() {
        return configInicial == 0
    }

    method saldo() {
        return saldo
    }

    method depositar(monto) {
        saldo += monto
    }

    method extraer(monto) {
        self.validarSaldoSuficiente(monto)
        saldo -= monto
    }

    method validarSaldoSuficiente(monto) { 
        if (monto > saldo) {
            self.error("no hay saldo suficiente para realizar la operación.")
        }
    }
}

object conGastos {
    var saldo = 0
    var configInicial = 0
    var property costoDeOperacion = 0

    method configuracionInicial(monto) {
        self.validarConfigInicial()
        saldo = monto
        configInicial = 1   
    }

    method validarConfigInicial() {
        if (! self.esConfigInicial()) {
            self.error("ya se configuró el saldo inicial, solo se puede una vez")
        }
    }

    method esConfigInicial() {
        return configInicial == 0
    }

    method saldo() {
        return saldo
    }

    method depositar(monto) {
        self.validarOperacion(monto)     
        saldo += monto - costoDeOperacion
    }

    method validarOperacion(monto) {
        if (monto > 1000) {
            self.error("no se permite depositar más de $1000. AFIP RES Hornerito.")
        } 
    }

    method extraer(monto) {
        saldo -= monto
    }
}

object banco {
    var property cuenta = corriente
    var property procedimiento = {}

    method operar() {
        procedimiento.apply(cuenta)
    }
}
