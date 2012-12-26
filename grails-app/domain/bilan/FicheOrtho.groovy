package bilan

class FicheOrtho {

    String titre

    static belongsTo = DomaineOrtho
    static hasMany = [domaines: DomaineOrtho]

    Versant versant

    Integer ageDebut
    Integer ageFin

    String passationTxt
    String cotationTxt
    String seuilPathoTxt

    String avantagesTxt
    String inconvenientsTxt

    static constraints = {
        titre(nullable: false, size: 1..50)
        ageDebut(nullable: false, min: 0, validator: { val, obj -> val <= obj.ageFin })
        ageFin(nullable: false, min: 0, validator: { val, obj -> obj.ageDebut <= val })
        passationTxt(nullable: true, maxSize: 255)
        cotationTxt(nullable: true, maxSize: 255)
        seuilPathoTxt(nullable: true, maxSize: 255)
        avantagesTxt(nullable: true, maxSize: 255)
        inconvenientsTxt(nullable: true, maxSize: 255)
    }
}
