package app_nutri

class Refeicao {

    String horario
    List<Alimento> alimentos
    String observacao

    static belongsTo = [planoDiario: PlanoDiario]

    static constraints = {
        observacao nullable: true
    }
}
