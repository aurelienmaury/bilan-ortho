import bilan.*


class BootStrap {

    def init = { servletContext ->

        new DomaineOrtho(nom: 'Morphosyntaxe').save()
        new DomaineOrtho(nom: 'Phonologie').save()

        new ThemeDeveloppemental(nom: 'Psychomotricité').save()
        new ThemeDeveloppemental(nom: 'Elocution').save()
    }
    def destroy = {
    }
}
