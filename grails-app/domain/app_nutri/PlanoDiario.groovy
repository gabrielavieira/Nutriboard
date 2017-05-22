package app_nutri

import enums.DiaSemana

class PlanoDiario {

    DiaSemana dia

    static hasMany = [refeicoes: Refeicao]

    static belongsTo = [planoAlimentar: PlanoAlimentar]

    static constraints = {}

    def clonar( PlanoDiario planoDiario ){
        PlanoDiario novo = new PlanoDiario()
        novo.dia = planoDiario.dia

        if( planoDiario?.refeicoes != null && planoDiario?.refeicoes?.size() > 0 ){
            planoDiario?.refeicoes.each{ novo.addToRefeicoes( it.clonar(it) ) }
        }

        return novo
    }

}
