package app_nutri

import enums.Patologia

class Anamnese {

    List<Patologia> patologias
    String suplementos
    String alergiaAlimentar
    String intoleranciaAlimentar
    Date data
    HabitoDeVida habitoDeVida

    static belongsTo = [paciente: Paciente]

    static constraints = {
        habitoDeVida nullable: true
        patologias nullable: true
        suplementos nullable: true
        alergiaAlimentar nullable: true
        intoleranciaAlimentar nullable: true
    }

    static mapping = {
        habitoDeVida cascade: "save-update"
    }

}
