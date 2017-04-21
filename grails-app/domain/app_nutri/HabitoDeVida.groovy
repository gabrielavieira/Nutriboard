package app_nutri

import enums.OpcaoAlimentar

class HabitoDeVida {

    OpcaoAlimentar opcaoAlimentar
    Boolean isAlcoolatra
    Boolean isFumante

    static constraints = {
        opcaoAlimentar nullable: true
    }

}
