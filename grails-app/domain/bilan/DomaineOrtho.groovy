package bilan

class DomaineOrtho {

    String nom

    static hasMany = [fiches: FicheOrtho]

    static constraints = {
        nom(nullable: false, size: 1..50)
    }
}
