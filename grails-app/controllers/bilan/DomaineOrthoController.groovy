package bilan

import org.springframework.dao.DataIntegrityViolationException

class DomaineOrthoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [domaineOrthoInstanceList: DomaineOrtho.list(params), domaineOrthoInstanceTotal: DomaineOrtho.count()]
    }

    def create() {
        [domaineOrthoInstance: new DomaineOrtho(params)]
    }

    def save() {
        def domaineOrthoInstance = new DomaineOrtho(params)
        if (!domaineOrthoInstance.save(flush: true)) {
            render(view: "create", model: [domaineOrthoInstance: domaineOrthoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), domaineOrthoInstance.id])
        redirect(action: "show", id: domaineOrthoInstance.id)
    }

    def show(Long id) {
        def domaineOrthoInstance = DomaineOrtho.get(id)
        if (!domaineOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), id])
            redirect(action: "list")
            return
        }

        [domaineOrthoInstance: domaineOrthoInstance]
    }

    def edit(Long id) {
        def domaineOrthoInstance = DomaineOrtho.get(id)
        if (!domaineOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), id])
            redirect(action: "list")
            return
        }

        [domaineOrthoInstance: domaineOrthoInstance]
    }

    def update(Long id, Long version) {
        def domaineOrthoInstance = DomaineOrtho.get(id)
        if (!domaineOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (domaineOrthoInstance.version > version) {
                domaineOrthoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'domaineOrtho.label', default: 'DomaineOrtho')] as Object[],
                          "Another user has updated this DomaineOrtho while you were editing")
                render(view: "edit", model: [domaineOrthoInstance: domaineOrthoInstance])
                return
            }
        }

        domaineOrthoInstance.properties = params

        if (!domaineOrthoInstance.save(flush: true)) {
            render(view: "edit", model: [domaineOrthoInstance: domaineOrthoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), domaineOrthoInstance.id])
        redirect(action: "show", id: domaineOrthoInstance.id)
    }

    def delete(Long id) {
        def domaineOrthoInstance = DomaineOrtho.get(id)
        if (!domaineOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), id])
            redirect(action: "list")
            return
        }

        try {
            domaineOrthoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'domaineOrtho.label', default: 'DomaineOrtho'), id])
            redirect(action: "show", id: id)
        }
    }
}
