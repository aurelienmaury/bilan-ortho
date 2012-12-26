package bilan



import org.junit.*
import grails.test.mixin.*

@TestFor(FicheOrthoController)
@Mock(FicheOrtho)
class FicheOrthoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ficheOrtho/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ficheOrthoInstanceList.size() == 0
        assert model.ficheOrthoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ficheOrthoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ficheOrthoInstance != null
        assert view == '/ficheOrtho/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ficheOrtho/show/1'
        assert controller.flash.message != null
        assert FicheOrtho.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ficheOrtho/list'

        populateValidParams(params)
        def ficheOrtho = new FicheOrtho(params)

        assert ficheOrtho.save() != null

        params.id = ficheOrtho.id

        def model = controller.show()

        assert model.ficheOrthoInstance == ficheOrtho
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ficheOrtho/list'

        populateValidParams(params)
        def ficheOrtho = new FicheOrtho(params)

        assert ficheOrtho.save() != null

        params.id = ficheOrtho.id

        def model = controller.edit()

        assert model.ficheOrthoInstance == ficheOrtho
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ficheOrtho/list'

        response.reset()

        populateValidParams(params)
        def ficheOrtho = new FicheOrtho(params)

        assert ficheOrtho.save() != null

        // test invalid parameters in update
        params.id = ficheOrtho.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ficheOrtho/edit"
        assert model.ficheOrthoInstance != null

        ficheOrtho.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ficheOrtho/show/$ficheOrtho.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ficheOrtho.clearErrors()

        populateValidParams(params)
        params.id = ficheOrtho.id
        params.version = -1
        controller.update()

        assert view == "/ficheOrtho/edit"
        assert model.ficheOrthoInstance != null
        assert model.ficheOrthoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ficheOrtho/list'

        response.reset()

        populateValidParams(params)
        def ficheOrtho = new FicheOrtho(params)

        assert ficheOrtho.save() != null
        assert FicheOrtho.count() == 1

        params.id = ficheOrtho.id

        controller.delete()

        assert FicheOrtho.count() == 0
        assert FicheOrtho.get(ficheOrtho.id) == null
        assert response.redirectedUrl == '/ficheOrtho/list'
    }
}
