package nuevaruta

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReservaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reserva.list(params), model:[reservaCount: Reserva.count()]
    }

    def show(Reserva reserva) {
        respond reserva
    }

    def create() {
        respond new Reserva(params)
    }

    @Transactional
    def save(Reserva reserva) {
        if (reserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (reserva.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond reserva.errors, view:'create'
            return
        }

        reserva.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                redirect reserva
            }
            '*' { respond reserva, [status: CREATED] }
        }
    }

    def edit(Reserva reserva) {
        respond reserva
    }

    @Transactional
    def update(Reserva reserva) {
        if (reserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (reserva.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond reserva.errors, view:'edit'
            return
        }

        reserva.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                redirect reserva
            }
            '*'{ respond reserva, [status: OK] }
        }
    }

    @Transactional
    def delete(Reserva reserva) {

        if (reserva == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        reserva.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
