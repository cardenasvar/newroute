package nuevaruta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PagoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pago.list(params), model:[pagoCount: Pago.count()]
    }

    def show(Pago pago) {
        respond pago
    }

    def create() {
        respond new Pago(params)
    }

    @Transactional
    def save(Pago pago) {
        if (pago == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pago.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pago.errors, view:'create'
            return
        }

        pago.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pago.label', default: 'Pago'), pago.id])
                redirect pago
            }
            '*' { respond pago, [status: CREATED] }
        }
    }

    def edit(Pago pago) {
        respond pago
    }

    @Transactional
    def update(Pago pago) {
        if (pago == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pago.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pago.errors, view:'edit'
            return
        }

        pago.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'pago.label', default: 'Pago'), pago.id])
                redirect pago
            }
            '*'{ respond pago, [status: OK] }
        }
    }

    @Transactional
    def delete(Pago pago) {

        if (pago == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        pago.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'pago.label', default: 'Pago'), pago.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pago.label', default: 'Pago'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
