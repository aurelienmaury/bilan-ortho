package bilan

import org.springframework.dao.DataIntegrityViolationException

class RepereDeveloppementalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [repereDeveloppementalInstanceList: RepereDeveloppemental.list(params), repereDeveloppementalInstanceTotal: RepereDeveloppemental.count()]
    }

    def diag() {

        int nbCritere = params.desc ? params.desc.size() : 0

        if (nbCritere) {
            def criteresRes = [criteres: []]

            def description = []
            description.addAll(params.desc)
            def age = []
            age.addAll(params.age)

            println "desc = $description"
            println "age = $age"
            nbCritere.times { i ->

                def repere = RepereDeveloppemental.findByDescriptionIlike("%${description[i]}%")

                if (repere) {
                    println "found $repere"
                    if (repere.ageDebut <= age[i].toInteger() && age[i].toInteger() <= repere.ageFin) {
                        criteresRes.criteres << [desc: repere.description, age: age[i].toInteger(), ok: true, msg: "de X a Y ans"]
                    } else {
                        criteresRes.criteres << [desc: repere.description, age: age[i].toInteger(), ok: false, msg: "de X a Y ans"]
                    }
                }
            }

            criteresRes
        }
    }

    def create() {
        [repereDeveloppementalInstance: new RepereDeveloppemental(params)]
    }

    def save() {
        def repereDeveloppementalInstance = new RepereDeveloppemental(params)
        if (!repereDeveloppementalInstance.save(flush: true)) {
            render(view: "create", model: [repereDeveloppementalInstance: repereDeveloppementalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), repereDeveloppementalInstance.id])
        redirect(action: "show", id: repereDeveloppementalInstance.id)
    }

    def show(Long id) {
        def repereDeveloppementalInstance = RepereDeveloppemental.get(id)
        if (!repereDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        [repereDeveloppementalInstance: repereDeveloppementalInstance]
    }

    def edit(Long id) {
        def repereDeveloppementalInstance = RepereDeveloppemental.get(id)
        if (!repereDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        [repereDeveloppementalInstance: repereDeveloppementalInstance]
    }

    def update(Long id, Long version) {
        def repereDeveloppementalInstance = RepereDeveloppemental.get(id)
        if (!repereDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (repereDeveloppementalInstance.version > version) {
                repereDeveloppementalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental')] as Object[],
                        "Another user has updated this RepereDeveloppemental while you were editing")
                render(view: "edit", model: [repereDeveloppementalInstance: repereDeveloppementalInstance])
                return
            }
        }

        repereDeveloppementalInstance.properties = params

        if (!repereDeveloppementalInstance.save(flush: true)) {
            render(view: "edit", model: [repereDeveloppementalInstance: repereDeveloppementalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), repereDeveloppementalInstance.id])
        redirect(action: "show", id: repereDeveloppementalInstance.id)
    }

    def delete(Long id) {
        def repereDeveloppementalInstance = RepereDeveloppemental.get(id)
        if (!repereDeveloppementalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), id])
            redirect(action: "list")
            return
        }

        try {
            repereDeveloppementalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'repereDeveloppemental.label', default: 'RepereDeveloppemental'), id])
            redirect(action: "show", id: id)
        }
    }
}
