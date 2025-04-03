class Empresa {
    var property nombre
    const cuit
    const empleados = []
    var saldoEmpresarial 

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
        ReciboHaberes.crearReciboHaberes()
        saldoEmpresarial =- self.totalSueldoNeto()
    }

    method cuit() {
        return cuit
    }
}

class Empleado {

    var property nombre
    var property direccion
    var property estadoCivil
    var property fechaNacimineto 
    var property fechaIngreso
    var property salarioBasico

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

    method nombre() {
        return nombre
    }

    method direccion() {
        return direccion
    }

    method estadoCivil() {
        return estadoCivil
    }

    method salarioBasico() {
        return salarioBasico
    }

    method conceptos() {
        return ["sueldo basico " + self.sueldoBasico(), "retenciones " + self.retenciones(), "obra social " + self.obraSocial(), "aporte jubilatorio " + self.aportesJubilatorio()]
    }

    method desgloceConceptos() {
        return ["Retenciones : " + self.retenciones(),
                "Obra Social : " + self.obraSocial(),
                "Aportes Jubilatorios : " + self.aportesJubilatorio()
                ]
    }
}

class EmpleadoPermanente inherits Empleado {
    var property cantidadHijos

    method salarioFamiliar() {
        return cantidadHijos * 150 + self.asignacionConyugue()
    }

    method asignacionConyugue() {
        return 100 + ( 50 * self.antiguedad() )
    }

    override method retenciones() {
        return super() + self.asignacionFamiliar() + self.aportesJubilatorio()
    }

    method asignacionFamiliar() {
        return 20 * cantidadHijos 
    }

    override method sueldoBruto() {
        return super() + self.salarioFamiliar()
    }

    override method porcentajeJubilatorio() {
        return 0.15
    }

    override method desgloceConceptos() {
        return super() + [ "Asignacion Familiar : " + self.asignacionFamiliar() ]
    }
}

class EmpleadoTemporal inherits Empleado {

    var property fechaFinalPlantaTemporal
    var property horasExtra = 0

    override method sueldoBruto() {
        return self.sueldoBasico() + 40 * horasExtra
    }

    override method retenciones() {
        return super() + self.aportesJubilatorio() + self.conceptoHorasExtra()
    }

    method conceptoHorasExtra() {
        return 5 * horasExtra
    }

    override method aportesJubilatorio() {
        return if ( self.antiguedad() > 50) self.sueldoBruto() * 0.25 else super()
    }

    override method porcentajeJubilatorio() {
        return 0.10
    }

    override method desgloceConceptos() {
        return super() + ["Horas Extra : " + self.conceptoHorasExtra()]
    }
}
class ReciboHaberes {
    const empleados = []
    var fechaActual = new Date()
    const recibosHaberes = []

    method crearReciboHaberes(empleado) { // lo hace con uno despues hacerlo para toda la lista
        return [
        "Nombre : " + empleado.nombre(),
        "Dirección: " + empleado.direccion(),
        "Fecha de Emisión: " + fechaActual,
        "Sueldo Bruto: " + empleado.calcularSueldoBruto(),
        "Sueldo Neto: " + empleado.calcularSueldoNeto()
        ]
    }

    


}
