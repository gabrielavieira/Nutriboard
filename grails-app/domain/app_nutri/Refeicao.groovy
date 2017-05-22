package app_nutri

class Refeicao {

    String horario
    List<Alimento> alimentos
    String observacao

    static constraints = {
        alimentos nullable: true
        observacao nullable: true
    }

    String getDescricao(){
        String descricao = ""
        alimentos.each{ alimento ->
            descricao += alimento.descricao + " Porção: " + alimento.porcao + " " + alimento.unidadeMedida + "; "
        }
        return descricao
    }

    def clonar( Refeicao refeicao ){
        Refeicao nova = new Refeicao()
        nova.horario = refeicao.horario
        nova.observacao = refeicao.observacao
        nova.alimentos = new ArrayList<>()

        if( refeicao.alimentos != null && refeicao.alimentos?.size() > 0 ){
            refeicao.alimentos.each { nova.alimentos.add( it ) }
        }

        nova.save( flush: true )

        return nova
    }
}
