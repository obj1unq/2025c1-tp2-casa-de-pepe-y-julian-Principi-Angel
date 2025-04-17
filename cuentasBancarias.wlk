import cosas.*
object corriente {
    var saldo = 0
    var configInicial = 0

    method configuracionInicial(monto) {
        if (configInicial == 0) {
            saldo = monto
            configInicial = 1
        } else {
            self.error("ya se setteó el saldo, solo se puede una vez")
        }
    }

    method saldo() {
        return saldo
    }

    method depositar(monto) {
        saldo += monto
    }

    method extraer(monto) {
        if (monto > saldo) {
            self.error("no hay saldo suficiente para realizar la operación.")
        } else {
            saldo -= monto
        }
    }
}

object conGastos {
    var saldo = 0
    var configInicial = 0
    var property costoDeOperacion = 0

    method configuracionInicial(monto) {
        if (configInicial == 0) {
            saldo = monto
            configInicial = 1
        } else {
            self.error("ya se setteó el saldo, solo se puede una vez")
        }
    }

    method saldo() {
        return saldo
    }

    method depositar(monto) {
        if (monto > 1000) {
            self.error("no se permite depositar más de $1000. RES AFIP Hornerito.")
        } else {
            saldo += monto - costoDeOperacion
    }
    }

    method extraer(monto) {
        saldo -= monto
    }
}
