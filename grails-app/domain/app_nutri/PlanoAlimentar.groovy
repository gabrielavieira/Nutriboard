package app_nutri

class PlanoAlimentar {

    Date data
    String descricao

    static hasMany = [planosDiarios: PlanoDiario]

    static belongsTo = [paciente: Paciente]

    static constraints = {
        planosDiarios nullable: true
    }

}
