package app_nutri

class Receita {

    String nome
    String descricao

    static hasMany = [alimentos: Alimento]

    static constraints = {
        alimentos nullable: true
    }

}
