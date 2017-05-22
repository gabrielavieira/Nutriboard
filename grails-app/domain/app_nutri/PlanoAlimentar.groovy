package app_nutri

class PlanoAlimentar {

    Date data
    String descricao

    static belongsTo = [paciente: Paciente]

    static hasMany = [planosDiarios: PlanoDiario]

    static constraints = {
        planosDiarios nullable: true
    }

}
