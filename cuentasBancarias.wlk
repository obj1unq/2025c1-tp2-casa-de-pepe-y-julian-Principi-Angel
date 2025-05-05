import cosas.*
object corriente {
    var saldo = 1000

    method saldo() {
        return saldo
    }

    method depositar(monto) {
        saldo += monto
    }

    method extraer(monto) {
        self.validarExtraer(monto)
        saldo -= monto
    }

    method validarExtraer(monto) { 
        if (! self.puedeExtraer(monto)) {
            self.error("no hay saldo suficiente para realizar la operación.")
        }
    }

    method puedeExtraer(monto) {
        return saldo >= monto 
    }
}

object conGastos {
    var saldo = 0
    var property costoDeOperacion = 0

    method saldo() {
        return saldo
    }

    method depositar(monto) {
        self.validarDepositar(monto)     
        saldo += monto - costoDeOperacion
    }

    method validarDepositar(monto) {
        if (! self.puedeDepositar(monto)) {
            self.error("no se permite depositar más de $1000. AFIP RES Hornerito.")
        } 
    }

    method puedeDepositar(monto) {
        return monto <= self.montoMaxDeDeposito()
    }

    method montoMaxDeDeposito() {
        return 1000
    }

    method extraer(monto) {
        saldo -= monto
    }
}