package app_nutri

class PlanoAlimentar {

    Date data
    String descricao

    static belongsTo = [paciente: Paciente]

    static hasMany = [planosDiarios: PlanoDiario]

    static constraints = {
        planosDiarios nullable: true
    }

    def clonar( PlanoAlimentar planoAlimentar ){
        PlanoAlimentar novo = new PlanoAlimentar()
        novo.data = new Date()
        novo.descricao = "Primeiro Plano Alimentar"

        if( planoAlimentar?.planosDiarios != null && planoAlimentar.planosDiarios?.size() > 0 ){
            planoAlimentar.planosDiarios.each{ novo.addToPlanosDiarios( it.clonar( it ) ) }
        }

        return novo
    }

}
