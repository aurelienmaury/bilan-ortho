package bilan



import org.junit.*
import grails.test.mixin.*

@TestFor(DomaineOrthoController)
@Mock(DomaineOrtho)
class DomaineOrthoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/domaineOrtho/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.domaineOrthoInstanceList.size() == 0
        assert model.domaineOrthoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.domaineOrthoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.domaineOrthoInstance != null
        assert view == '/domaineOrtho/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/domaineOrtho/show/1'
        assert controller.flash.message != null
        assert DomaineOrtho.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/domaineOrtho/list'

        populateValidParams(params)
        def domaineOrtho = new DomaineOrtho(params)

        assert domaineOrtho.save() != null

        params.id = domaineOrtho.id

        def model = controller.show()

        assert model.domaineOrthoInstance == domaineOrtho
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/domaineOrtho/list'

        populateValidParams(params)
        def domaineOrtho = new DomaineOrtho(params)

        assert domaineOrtho.save() != null

        params.id = domaineOrtho.id

        def model = controller.edit()

        assert model.domaineOrthoInstance == domaineOrtho
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/domaineOrtho/list'

        response.reset()

        populateValidParams(params)
        def domaineOrtho = new DomaineOrtho(params)

        assert domaineOrtho.save() != null

        // test invalid parameters in update
        params.id = domaineOrtho.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/domaineOrtho/edit"
        assert model.domaineOrthoInstance != null

        domaineOrtho.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/domaineOrtho/show/$domaineOrtho.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        domaineOrtho.clearErrors()

        populateValidParams(params)
        params.id = domaineOrtho.id
        params.version = -1
        controller.update()

        assert view == "/domaineOrtho/edit"
        assert model.domaineOrthoInstance != null
        assert model.domaineOrthoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/domaineOrtho/list'

        response.reset()

        populateValidParams(params)
        def domaineOrtho = new DomaineOrtho(params)

        assert domaineOrtho.save() != null
        assert DomaineOrtho.count() == 1

        params.id = domaineOrtho.id

        controller.delete()

        assert DomaineOrtho.count() == 0
        assert DomaineOrtho.get(domaineOrtho.id) == null
        assert response.redirectedUrl == '/domaineOrtho/list'
    }
}
