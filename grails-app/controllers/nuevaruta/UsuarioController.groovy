package nuevaruta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max,Usuario usuario) {
        def usuarios = Usuario.list(params);
        params.max = Math.min(max ?: 10, 100)
        if(params.id!=null){
            respond usuario, model:[usuarioCount: Usuario.count(), usuarioList:usuarios]
        }else{
            respond new Usuario(params), model:[usuarioCount: Usuario.count(), usuarioList:usuarios]
        }

    }

    def show(Usuario usuario) {
        redirect(controller:"usuario", action: "index")
        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id, usuario.nombres, usuario.paterno +' '+ usuario.materno])
    }

    def create() {
        respond new Usuario(params)
    }

    @Transactional
    def save(Usuario usuario) {
        if (usuario == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (usuario.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond usuario.errors, view:'create'
            return
        }

        usuario.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*' { respond usuario, [status: CREATED] }
        }
    }

    def edit(Usuario usuario) {
        respond usuario
    }
    def eliminar(){
        def usuario = Usuario.get(params.id)
        usuario.delete(flush:true)
        redirect (controller: "usuario", action: "index")
    }

    @Transactional
    def update(Usuario usuario) {
        if (usuario == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (usuario.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond usuario.errors, view:'edit'
            return
        }

        usuario.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*'{ respond usuario, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuario) {

        if (usuario == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        usuario.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
