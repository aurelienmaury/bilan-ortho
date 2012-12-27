package bilan

class RepereDeveloppemental {

    Integer ageDebut

    Integer ageFin

    String description

    static belongsTo = [theme: ThemeDeveloppemental]

    static constraints = {
        // debut <= fin
        // description obligatoire

    }
}
