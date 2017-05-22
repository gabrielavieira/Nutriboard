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
}
