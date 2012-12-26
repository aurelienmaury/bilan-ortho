package bilan

class ThemeDeveloppemental {

    String nom

    static hasMany = [reperes: RepereDeveloppemental]

    static constraints = {
    }
}
