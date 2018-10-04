package nuevaruta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClienteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max,Cliente cliente) {
        def clientes = Cliente.list(params);
        params.max = Math.min(max ?: 10, 100)
        if(params.id!=null){
            respond cliente, model:[clienteCount: Cliente.count(), clienteList:clientes]
        }else{
            respond new Cliente(params), model:[clienteCount: Cliente.count(), clienteList:clientes]
        }

    }

    def show(Cliente cliente) {
        redirect(controller:"cliente", action: "index")
        flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.rut, cliente.nombres, cliente.paterno+" "+cliente.materno])
    }

    def create() {
        respond new Cliente(params)
    }

    @Transactional
    def save(Cliente cliente) {
        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'create'
            return
        }
        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect cliente
            }
            '*' { respond cliente, [status: CREATED] }
        }
    }

    def edit(Cliente cliente) {
        respond cliente
    }
    def eliminar(){
        def cliente = Cliente.get(params.id)
        cliente.delete(flush:true)
        redirect (controller: "cliente", action: "index")
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id, cliente.marca, cliente.modelo])
    }

    @Transactional
    def update(Cliente cliente) {
        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'edit'
            return
        }

        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect cliente
            }
            '*'{ respond cliente, [status: OK] }
        }
    }
    def updateCliente(Cliente cliente) {
        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'edit'
            return
        }

        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect controller: "principal",action: "perfil", params:[idCliente:session.clienteLogeado.id]
            }
            '*'{ respond cliente, [status: OK] }
        }
    }
    @Transactional
    def delete(Cliente cliente) {

        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        cliente.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
