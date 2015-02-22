package contabilidad



import grails.test.mixin.*
import spock.lang.*

@TestFor(MovimientoController)
@Mock(Movimiento)
class MovimientoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.movimientoInstanceList
            model.movimientoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.movimientoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def movimiento = new Movimiento()
            movimiento.validate()
            controller.save(movimiento)

        then:"The create view is rendered again with the correct model"
            model.movimientoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            movimiento = new Movimiento(params)

            controller.save(movimiento)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/movimiento/show/1'
            controller.flash.message != null
            Movimiento.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def movimiento = new Movimiento(params)
            controller.show(movimiento)

        then:"A model is populated containing the domain instance"
            model.movimientoInstance == movimiento
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def movimiento = new Movimiento(params)
            controller.edit(movimiento)

        then:"A model is populated containing the domain instance"
            model.movimientoInstance == movimiento
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/movimiento/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def movimiento = new Movimiento()
            movimiento.validate()
            controller.update(movimiento)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.movimientoInstance == movimiento

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            movimiento = new Movimiento(params).save(flush: true)
            controller.update(movimiento)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/movimiento/show/$movimiento.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/movimiento/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def movimiento = new Movimiento(params).save(flush: true)

        then:"It exists"
            Movimiento.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(movimiento)

        then:"The instance is deleted"
            Movimiento.count() == 0
            response.redirectedUrl == '/movimiento/index'
            flash.message != null
    }
}
