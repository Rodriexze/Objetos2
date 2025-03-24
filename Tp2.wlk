class Empresa {
    var property nombre
    var cuit
    var empleados = []
    var saldoEmpresarial

    method totalSueldoBruto() {
        return empleados.sueldoBruto().sum()
    }

    method totalSueldoNeto() {
        return empleados.sueldoNeto().sum()
    }

    method totalRetenciones() {
        return empleados.retenciones().sum()
    }
    method liquidarSueldos() {
        saldoEmpresarial - self().totalSueldoNeto()
    }
}

data fecha = dd | mm | yyyy
            deriving show

class Empleado {

    var nombre
    var direccion
    var estadoCivil
    var fechaNacimineto
    var sueldoBasico

    method SueldoBruto() {
    }

    method SueldoNEto() {
    }

    method retenciones() {
    }

    method edad(fecha) {
        return 2025 - fecha.yyyy()
    }
}