package bilan

import org.springframework.dao.DataIntegrityViolationException

class FicheOrthoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def search() {

    }

    def list(Integer max) {
        if (params.ans || params.mois) {
            Integer mois = 0

            if (params.mois) {
                mois += params.mois as Integer
            }

            if (params.ans) {
                mois += (params.ans as Integer) * 12
            }

            println "searching for mois = $mois"

            [ficheOrthoInstanceList: FicheOrtho.findByAgeDebutLessThanEqualsAndAgeFinGreaterThanEquals(mois, mois), ficheOrthoInstanceTotal: FicheOrtho.count()]
        } else {
            params.max = Math.min(max ?: 10, 100)
            [ficheOrthoInstanceList: FicheOrtho.list(params), ficheOrthoInstanceTotal: FicheOrtho.count()]
        }
    }



    def create() {
        [ficheOrthoInstance: new FicheOrtho(params)]
    }

    def save() {
        def ficheOrthoInstance = new FicheOrtho(params)

        if (!ficheOrthoInstance.save(flush: true)) {
            render(view: "create", model: [ficheOrthoInstance: ficheOrthoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), ficheOrthoInstance.id])
        redirect(action: "show", id: ficheOrthoInstance.id)
    }

    def show(Long id) {
        def ficheOrthoInstance = FicheOrtho.get(id)
        if (!ficheOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), id])
            redirect(action: "list")
            return
        }

        [ficheOrthoInstance: ficheOrthoInstance]
    }

    def edit(Long id) {
        def ficheOrthoInstance = FicheOrtho.get(id)
        if (!ficheOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), id])
            redirect(action: "list")
            return
        }

        [ficheOrthoInstance: ficheOrthoInstance]
    }

    def update(Long id, Long version) {
        def ficheOrthoInstance = FicheOrtho.get(id)




        if (!ficheOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ficheOrthoInstance.version > version) {
                ficheOrthoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'ficheOrtho.label', default: 'FicheOrtho')] as Object[],
                        "Another user has updated this FicheOrtho while you were editing")
                render(view: "edit", model: [ficheOrthoInstance: ficheOrthoInstance])
                return
            }
        }

        // Update Domaines link management
        def domainesLink = ([] << (params.domaines)).flatten().collect { it as Long }
        def domainesNoLink = ficheOrthoInstance.domaines*.id

        domainesNoLink.removeAll(domainesLink)

        domainesNoLink.each {
            DomaineOrtho linkToRemove = DomaineOrtho.get(it)
            if (linkToRemove) {
                ficheOrthoInstance.removeFromDomaines(linkToRemove)
            }
        }
        // END - Update Domaines link management

        ficheOrthoInstance.properties = params

        if (!ficheOrthoInstance.save(flush: true)) {
            render(view: "edit", model: [ficheOrthoInstance: ficheOrthoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), ficheOrthoInstance.id])
        redirect(action: "show", id: ficheOrthoInstance.id)
    }

    def delete(Long id) {
        def ficheOrthoInstance = FicheOrtho.get(id)
        if (!ficheOrthoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), id])
            redirect(action: "list")
            return
        }

        try {
            ficheOrthoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ficheOrtho.label', default: 'FicheOrtho'), id])
            redirect(action: "show", id: id)
        }
    }
}
