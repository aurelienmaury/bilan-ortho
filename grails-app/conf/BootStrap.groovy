import bilan.*


class BootStrap {

    def init = { servletContext ->

        new DomaineOrtho(nom: 'Morphosyntaxe').save()
        new DomaineOrtho(nom: 'Phonologie').save()
    }
    def destroy = {
    }
}
