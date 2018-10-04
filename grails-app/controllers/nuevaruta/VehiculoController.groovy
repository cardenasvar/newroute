package nuevaruta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.sql.*

@Transactional(readOnly = true)
class VehiculoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def dataSource
    def index(Integer max,Vehiculo vehiculo) {
        def vehiculos = Vehiculo.list(params);
        params.max = Math.min(max ?: 10, 100)
        if(params.id!=null){
            respond vehiculo, model:[vehiculoCount: Vehiculo.count(), vehiculoList:vehiculos]
        }else{
            respond new Vehiculo(params), model:[vehiculoCount: Vehiculo.count(), vehiculoList:vehiculos]
        }

    }

    def show(Vehiculo vehiculo) {
        redirect(controller:"vehiculo", action: "index")
        flash.message = message(code: 'default.created.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), vehiculo.id, vehiculo.marca, vehiculo.modelo])
    }

    def create() {
        respond new Vehiculo(params)
    }

    @Transactional
    def save(Vehiculo vehiculo) {
        if (vehiculo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (vehiculo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond vehiculo.errors, view:'create'
            return
        }
        vehiculo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), vehiculo.id])
                redirect vehiculo
            }
            '*' { respond vehiculo, [status: CREATED] }
        }
    }

    def edit(Vehiculo vehiculo) {
        respond vehiculo
    }
    def eliminar(){
        def vehiculo = Vehiculo.get(params.id)
        vehiculo.delete(flush:true)
        redirect (controller: "vehiculo", action: "index")
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), vehiculo.id, vehiculo.marca, vehiculo.modelo])
    }

    @Transactional
    def update(Vehiculo vehiculo) {
        if (vehiculo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (vehiculo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond vehiculo.errors, view:'edit'
            return
        }

        vehiculo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), vehiculo.id])
                redirect vehiculo
            }
            '*'{ respond vehiculo, [status: OK] }
        }
    }

    @Transactional
    def delete(Vehiculo vehiculo) {

        if (vehiculo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        vehiculo.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), vehiculo.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def upload() {
        def f = request.getFile('archivo')
        if (f.empty) {
            flash.message = "Debes seleccionar un archivo para cargarlo a un Vehiculo."
            redirect(controller: "vehiculo", action: "index")
            return
        }
        String filePath = grailsApplication.config.getProperty('rutaArchivos.carpeta.absoluta')+params.idVehiculo + f?.filename
        f.transferTo(new File(filePath))
        Sql sql = new Sql(dataSource)
        sql.execute("update vehiculo as v set v.archivo='"+params.idVehiculo + f.filename+"' where id="+params.idVehiculo)
        //Vehiculo archivo = new Vehiculo(nombre: f?.filename, ruta: filePath, entidad: 'egreso', entidadId: params.idEgreso, creadoPor:session.usuarioLogueado.rut).save(flush:true, failOnError: true)
        flash.message = "Archivo Cargado Correctamente."
        redirect(controller: "vehiculo", action: "index")
    }
}
