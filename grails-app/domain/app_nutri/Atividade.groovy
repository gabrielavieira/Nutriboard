package app_nutri

class Atividade {

    String descricao
    Date data = new Date()
    Boolean realizada = false

    static constraints = {
        data nullable: true
    }
}
