package app_nutri

class Paciente {

    String nome
    String cpf
    Date dataNascimento
    String email
    Boolean ativo

    static hasMany = [avaliacoesAntropometricas : AvaliacaoAntropometrica]

    static constraints = {
        avaliacoesAntropometricas nullable: true
    }
}
