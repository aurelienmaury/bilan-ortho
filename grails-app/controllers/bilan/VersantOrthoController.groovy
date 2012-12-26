package bilan

import org.springframework.dao.DataIntegrityViolationException

class VersantOrthoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [versantOrthoInstanceList: VersantOrtho.list(params), versantOrthoInstanceTotal: VersantOrtho.count()]
    }

    def create() {
        [versantOrthoInstance: new VersantOrtho(params)]
    }

    def save() {
        def versantOrthoInstance = new VersantOrtho(params)
        if (!versantOrthoInstance.save(flush: true)) {
            render(view: "create", model: [versantOrthoInstance: versantOrthoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), versantOrthoInstance.id])
        redirect(action: "show", id: versantOrthoInstance.id)
    }

    def show(Long id) {
        def versantOrthoInstance = VersantOrtho.get(id)
        if (!versantOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), id])
            redirect(action: "list")
            return
        }

        [versantOrthoInstance: versantOrthoInstance]
    }

    def edit(Long id) {
        def versantOrthoInstance = VersantOrtho.get(id)
        if (!versantOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), id])
            redirect(action: "list")
            return
        }

        [versantOrthoInstance: versantOrthoInstance]
    }

    def update(Long id, Long version) {
        def versantOrthoInstance = VersantOrtho.get(id)
        if (!versantOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (versantOrthoInstance.version > version) {
                versantOrthoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'versantOrtho.label', default: 'VersantOrtho')] as Object[],
                          "Another user has updated this VersantOrtho while you were editing")
                render(view: "edit", model: [versantOrthoInstance: versantOrthoInstance])
                return
            }
        }

        versantOrthoInstance.properties = params

        if (!versantOrthoInstance.save(flush: true)) {
            render(view: "edit", model: [versantOrthoInstance: versantOrthoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), versantOrthoInstance.id])
        redirect(action: "show", id: versantOrthoInstance.id)
    }

    def delete(Long id) {
        def versantOrthoInstance = VersantOrtho.get(id)
        if (!versantOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), id])
            redirect(action: "list")
            return
        }

        try {
            versantOrthoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'versantOrtho.label', default: 'VersantOrtho'), id])
            redirect(action: "show", id: id)
        }
    }
}
