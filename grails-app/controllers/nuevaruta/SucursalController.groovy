package nuevaruta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SucursalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max,Sucursal sucursal) {
        def sucursals = Sucursal.list(params);
        params.max = Math.min(max ?: 10, 100)
        if(params.id!=null){
            respond sucursal, model:[sucursalCount: Sucursal.count(), sucursalList:sucursals]
        }else{
            respond new Sucursal(params), model:[sucursalCount: Sucursal.count(), sucursalList:sucursals]
        }

    }

    def show(Sucursal sucursal) {
        redirect(controller:"sucursal", action: "index")
        flash.message = message(code: 'default.created.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.rut, sucursal.nombre, sucursal.ciudad])
    }

    def create() {
        respond new Sucursal(params)
    }

    @Transactional
    def save(Sucursal sucursal) {
        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sucursal.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sucursal.errors, view:'create'
            return
        }
        sucursal.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.id])
                redirect sucursal
            }
            '*' { respond sucursal, [status: CREATED] }
        }
    }

    def edit(Sucursal sucursal) {
        respond sucursal
    }
    def eliminar(){
        def sucursal = Sucursal.get(params.id)
        sucursal.delete(flush:true)
        redirect (controller: "sucursal", action: "index")
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.id, sucursal.marca, sucursal.modelo])
    }

    @Transactional
    def update(Sucursal sucursal) {
        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sucursal.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sucursal.errors, view:'edit'
            return
        }

        sucursal.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.id])
                redirect sucursal
            }
            '*'{ respond sucursal, [status: OK] }
        }
    }

    @Transactional
    def delete(Sucursal sucursal) {

        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sucursal.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
