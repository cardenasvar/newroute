package nuevaruta

import grails.test.mixin.*
import spock.lang.*

@TestFor(ClienteController)
@Mock(Cliente)
class ClienteControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.clienteList
            model.clienteCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.cliente!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def cliente = new Cliente()
            cliente.validate()
            controller.save(cliente)

        then:"The create view is rendered again with the correct model"
            model.cliente!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            cliente = new Cliente(params)

            controller.save(cliente)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/cliente/show/1'
            controller.flash.message != null
            Cliente.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def cliente = new Cliente(params)
            controller.show(cliente)

        then:"A model is populated containing the domain instance"
            model.cliente == cliente
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def cliente = new Cliente(params)
            controller.edit(cliente)

        then:"A model is populated containing the domain instance"
            model.cliente == cliente
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/cliente/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def cliente = new Cliente()
            cliente.validate()
            controller.update(cliente)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.cliente == cliente

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            cliente = new Cliente(params).save(flush: true)
            controller.update(cliente)

        then:"A redirect is issued to the show action"
            cliente != null
            response.redirectedUrl == "/cliente/show/$cliente.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/cliente/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def cliente = new Cliente(params).save(flush: true)

        then:"It exists"
            Cliente.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(cliente)

        then:"The instance is deleted"
            Cliente.count() == 0
            response.redirectedUrl == '/cliente/index'
            flash.message != null
    }
}
