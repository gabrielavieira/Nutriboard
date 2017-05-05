package app_nutri

import enums.DiaSemana

class PlanoDiario {

    DiaSemana dia

    static hasMany = [refeicoes: Refeicao]

    static belongsTo = [planoAlimentar: PlanoAlimentar]

    static constraints = {}

}
