class Empresa {
    var property nombre
    var cuit
    const empleados = []
    var saldoEmpresarial 
    const recibosHaberes = [[]] //quiza no va aca

    method contratarEmpleado(empleado) {
        empleados.add(empleado)
    }

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
        self.generarYGuardarReciboHaberes(empleados)
        saldoEmpresarial =- self.totalSueldoNeto()
    }

    method generarYGuardarReciboHaberes(listaEmpleados) {
        listaEmpleados.forEach { elemento => elemento.nombre().direccion().fechaActual().sueldoBruto().sueldoNeto().conceptos()
                                recibosHaberes.add()
        }
    }
}

class Empleado {

    var nombre
    var direccion
    var estadoCivil
    const fechaNacimineto 
    const fechaIngreso = new Date()
    var salarioBasico
    var property horasExtra

    method edad() { //no va UML no es un metodo q acceda otra clase
        return self.fechaActual().year() - fechaNacimineto.year()
    }

    method antiguedad() {
        return self.fechaActual() - fechaIngreso
    }

    method fechaActual() {
        return new Date()
    }

    method sueldoBruto() {
        return self.sueldoBasico()
    }

    method sueldoBasico() {
        return salarioBasico
    }

    method sueldoNeto() {
        self.sueldoBruto() - self.retenciones()
    }

    method retenciones() {
        return self.obraSocial()
    }

    method aportesJubilatorio() {
        return self.sueldoBruto() * self.porcentajeJubilatorio()
    }

    method porcentajeJubilatorio() {
        return
    }

    method obraSocial() {
        return self.sueldoBruto() * 0.10
    }

    method conceptos() { //ver q onda
        return ["sueldo basico " + self.sueldoBasico(), "retenciones " + self.retenciones(), "obra social " + self.obraSocial(), "aporte jubilatorio " + self.aportesJubilatorio()]
    }
}

class EmpleadoPermanente inherits Empleado {
    var property fechaFinPlantaTemporal
    var property cantidadHijos

    method salarioFamiliar() {
        return cantidadHijos * 150 + self.asignacionConyugue()
    }

    method asignacionConyugue() {
        return 100 + ( 50 * self.antiguedad() )
    }

    override method retenciones() {
        return super() + 20 * cantidadHijos + self.aportesJubilatorio()
    }

    override method sueldoBruto() {
        return super() + self.salarioFamiliar()
    }

    override method porcentajeJubilatorio() {
        return 0.15
    }
}

class EmpleadoTemporal inherits Empleado {

    var property fechaFinalPlantaTemporal

    override method sueldoBruto() {
        return self.sueldoBasico() + 40 * horasExtra
    }

    override method retenciones() {
        return super() + self.aportesJubilatorio() + 5 * horasExtra
    }

    override method aportesJubilatorio() {
        return if ( self.antiguedad() > 50) self.sueldoBruto() * 0.25 else super()
    }

    override method porcentajeJubilatorio() {
        return 0.10
    }
}
class ReciboHaberes {
    const empleados = []
    var fechaActual new Date()

    method crearReciboHaberes() {
        
    }
}