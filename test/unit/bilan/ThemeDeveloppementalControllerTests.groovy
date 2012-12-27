package bilan



import org.junit.*
import grails.test.mixin.*

@TestFor(ThemeDeveloppementalController)
@Mock(ThemeDeveloppemental)
class ThemeDeveloppementalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/themeDeveloppemental/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.themeDeveloppementalInstanceList.size() == 0
        assert model.themeDeveloppementalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.themeDeveloppementalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.themeDeveloppementalInstance != null
        assert view == '/themeDeveloppemental/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/themeDeveloppemental/show/1'
        assert controller.flash.message != null
        assert ThemeDeveloppemental.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/themeDeveloppemental/list'

        populateValidParams(params)
        def themeDeveloppemental = new ThemeDeveloppemental(params)

        assert themeDeveloppemental.save() != null

        params.id = themeDeveloppemental.id

        def model = controller.show()

        assert model.themeDeveloppementalInstance == themeDeveloppemental
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/themeDeveloppemental/list'

        populateValidParams(params)
        def themeDeveloppemental = new ThemeDeveloppemental(params)

        assert themeDeveloppemental.save() != null

        params.id = themeDeveloppemental.id

        def model = controller.edit()

        assert model.themeDeveloppementalInstance == themeDeveloppemental
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/themeDeveloppemental/list'

        response.reset()

        populateValidParams(params)
        def themeDeveloppemental = new ThemeDeveloppemental(params)

        assert themeDeveloppemental.save() != null

        // test invalid parameters in update
        params.id = themeDeveloppemental.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/themeDeveloppemental/edit"
        assert model.themeDeveloppementalInstance != null

        themeDeveloppemental.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/themeDeveloppemental/show/$themeDeveloppemental.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        themeDeveloppemental.clearErrors()

        populateValidParams(params)
        params.id = themeDeveloppemental.id
        params.version = -1
        controller.update()

        assert view == "/themeDeveloppemental/edit"
        assert model.themeDeveloppementalInstance != null
        assert model.themeDeveloppementalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/themeDeveloppemental/list'

        response.reset()

        populateValidParams(params)
        def themeDeveloppemental = new ThemeDeveloppemental(params)

        assert themeDeveloppemental.save() != null
        assert ThemeDeveloppemental.count() == 1

        params.id = themeDeveloppemental.id

        controller.delete()

        assert ThemeDeveloppemental.count() == 0
        assert ThemeDeveloppemental.get(themeDeveloppemental.id) == null
        assert response.redirectedUrl == '/themeDeveloppemental/list'
    }
}
