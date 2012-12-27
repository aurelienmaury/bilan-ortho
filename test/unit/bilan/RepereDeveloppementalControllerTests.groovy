package bilan



import org.junit.*
import grails.test.mixin.*

@TestFor(RepereDeveloppementalController)
@Mock(RepereDeveloppemental)
class RepereDeveloppementalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/repereDeveloppemental/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.repereDeveloppementalInstanceList.size() == 0
        assert model.repereDeveloppementalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.repereDeveloppementalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.repereDeveloppementalInstance != null
        assert view == '/repereDeveloppemental/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/repereDeveloppemental/show/1'
        assert controller.flash.message != null
        assert RepereDeveloppemental.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/repereDeveloppemental/list'

        populateValidParams(params)
        def repereDeveloppemental = new RepereDeveloppemental(params)

        assert repereDeveloppemental.save() != null

        params.id = repereDeveloppemental.id

        def model = controller.show()

        assert model.repereDeveloppementalInstance == repereDeveloppemental
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/repereDeveloppemental/list'

        populateValidParams(params)
        def repereDeveloppemental = new RepereDeveloppemental(params)

        assert repereDeveloppemental.save() != null

        params.id = repereDeveloppemental.id

        def model = controller.edit()

        assert model.repereDeveloppementalInstance == repereDeveloppemental
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/repereDeveloppemental/list'

        response.reset()

        populateValidParams(params)
        def repereDeveloppemental = new RepereDeveloppemental(params)

        assert repereDeveloppemental.save() != null

        // test invalid parameters in update
        params.id = repereDeveloppemental.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/repereDeveloppemental/edit"
        assert model.repereDeveloppementalInstance != null

        repereDeveloppemental.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/repereDeveloppemental/show/$repereDeveloppemental.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        repereDeveloppemental.clearErrors()

        populateValidParams(params)
        params.id = repereDeveloppemental.id
        params.version = -1
        controller.update()

        assert view == "/repereDeveloppemental/edit"
        assert model.repereDeveloppementalInstance != null
        assert model.repereDeveloppementalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/repereDeveloppemental/list'

        response.reset()

        populateValidParams(params)
        def repereDeveloppemental = new RepereDeveloppemental(params)

        assert repereDeveloppemental.save() != null
        assert RepereDeveloppemental.count() == 1

        params.id = repereDeveloppemental.id

        controller.delete()

        assert RepereDeveloppemental.count() == 0
        assert RepereDeveloppemental.get(repereDeveloppemental.id) == null
        assert response.redirectedUrl == '/repereDeveloppemental/list'
    }
}
