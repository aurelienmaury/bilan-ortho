package bilan



import org.junit.*
import grails.test.mixin.*

@TestFor(VersantOrthoController)
@Mock(VersantOrtho)
class VersantOrthoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/versantOrtho/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.versantOrthoInstanceList.size() == 0
        assert model.versantOrthoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.versantOrthoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.versantOrthoInstance != null
        assert view == '/versantOrtho/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/versantOrtho/show/1'
        assert controller.flash.message != null
        assert VersantOrtho.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/versantOrtho/list'

        populateValidParams(params)
        def versantOrtho = new VersantOrtho(params)

        assert versantOrtho.save() != null

        params.id = versantOrtho.id

        def model = controller.show()

        assert model.versantOrthoInstance == versantOrtho
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/versantOrtho/list'

        populateValidParams(params)
        def versantOrtho = new VersantOrtho(params)

        assert versantOrtho.save() != null

        params.id = versantOrtho.id

        def model = controller.edit()

        assert model.versantOrthoInstance == versantOrtho
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/versantOrtho/list'

        response.reset()

        populateValidParams(params)
        def versantOrtho = new VersantOrtho(params)

        assert versantOrtho.save() != null

        // test invalid parameters in update
        params.id = versantOrtho.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/versantOrtho/edit"
        assert model.versantOrthoInstance != null

        versantOrtho.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/versantOrtho/show/$versantOrtho.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        versantOrtho.clearErrors()

        populateValidParams(params)
        params.id = versantOrtho.id
        params.version = -1
        controller.update()

        assert view == "/versantOrtho/edit"
        assert model.versantOrthoInstance != null
        assert model.versantOrthoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/versantOrtho/list'

        response.reset()

        populateValidParams(params)
        def versantOrtho = new VersantOrtho(params)

        assert versantOrtho.save() != null
        assert VersantOrtho.count() == 1

        params.id = versantOrtho.id

        controller.delete()

        assert VersantOrtho.count() == 0
        assert VersantOrtho.get(versantOrtho.id) == null
        assert response.redirectedUrl == '/versantOrtho/list'
    }
}
