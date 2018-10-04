package nuevaruta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContratoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contrato.list(params), model:[contratoCount: Contrato.count()]
    }

    def show(Contrato contrato) {
        respond contrato
    }

    def create() {
        respond new Contrato(params)
    }

    @Transactional
    def save(Contrato contrato) {
        if (contrato == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (contrato.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond contrato.errors, view:'create'
            return
        }

        contrato.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contrato.label', default: 'Contrato'), contrato.id])
                redirect contrato
            }
            '*' { respond contrato, [status: CREATED] }
        }
    }

    def edit(Contrato contrato) {
        respond contrato
    }

    @Transactional
    def update(Contrato contrato) {
        if (contrato == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (contrato.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond contrato.errors, view:'edit'
            return
        }

        contrato.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contrato.label', default: 'Contrato'), contrato.id])
                redirect contrato
            }
            '*'{ respond contrato, [status: OK] }
        }
    }

    @Transactional
    def delete(Contrato contrato) {

        if (contrato == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        contrato.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contrato.label', default: 'Contrato'), contrato.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contrato.label', default: 'Contrato'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
