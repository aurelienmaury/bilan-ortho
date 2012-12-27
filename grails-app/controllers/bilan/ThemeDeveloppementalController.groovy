package bilan

import org.springframework.dao.DataIntegrityViolationException

class ThemeDeveloppementalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [themeDeveloppementalInstanceList: ThemeDeveloppemental.list(params), themeDeveloppementalInstanceTotal: ThemeDeveloppemental.count()]
    }

    def create() {
        [themeDeveloppementalInstance: new ThemeDeveloppemental(params)]
    }

    def save() {
        def themeDeveloppementalInstance = new ThemeDeveloppemental(params)
        if (!themeDeveloppementalInstance.save(flush: true)) {
            render(view: "create", model: [themeDeveloppementalInstance: themeDeveloppementalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), themeDeveloppementalInstance.id])
        redirect(action: "show", id: themeDeveloppementalInstance.id)
    }

    def show(Long id) {
        def themeDeveloppementalInstance = ThemeDeveloppemental.get(id)
        if (!themeDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        [themeDeveloppementalInstance: themeDeveloppementalInstance]
    }

    def edit(Long id) {
        def themeDeveloppementalInstance = ThemeDeveloppemental.get(id)
        if (!themeDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        [themeDeveloppementalInstance: themeDeveloppementalInstance]
    }

    def update(Long id, Long version) {
        def themeDeveloppementalInstance = ThemeDeveloppemental.get(id)
        if (!themeDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (themeDeveloppementalInstance.version > version) {
                themeDeveloppementalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental')] as Object[],
                          "Another user has updated this ThemeDeveloppemental while you were editing")
                render(view: "edit", model: [themeDeveloppementalInstance: themeDeveloppementalInstance])
                return
            }
        }

        themeDeveloppementalInstance.properties = params

        if (!themeDeveloppementalInstance.save(flush: true)) {
            render(view: "edit", model: [themeDeveloppementalInstance: themeDeveloppementalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), themeDeveloppementalInstance.id])
        redirect(action: "show", id: themeDeveloppementalInstance.id)
    }

    def delete(Long id) {
        def themeDeveloppementalInstance = ThemeDeveloppemental.get(id)
        if (!themeDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        try {
            themeDeveloppementalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'themeDeveloppemental.label', default: 'ThemeDeveloppemental'), id])
            redirect(action: "show", id: id)
        }
    }
}
