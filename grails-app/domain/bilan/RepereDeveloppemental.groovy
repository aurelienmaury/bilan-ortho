package bilan

class RepereDeveloppemental {

    Integer debut

    Integer fin

    String description

    static belongsTo = [theme: ThemeDeveloppemental]

    static constraints = {
        // debut <= fin
        // description obligatoire

    }
}
