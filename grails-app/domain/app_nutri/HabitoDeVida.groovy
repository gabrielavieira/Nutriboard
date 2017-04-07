package app_nutri

class HabitoDeVida {

    /*TODO: Temporário*/
    enum OpcaoAlimentar{
        VEGETARIANO("vegetariano"),
        VEGANO("Vegano"),
        OUTROS("Outros")
    }

    OpcaoAlimentar opcaoAlimentar
    Boolean isAlcoolatra
    Boolean isFumante

    static constraints = {}

}
