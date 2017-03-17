package app_nutri

import java.text.DateFormat
import java.text.SimpleDateFormat

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

    String getDataFormatada(){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        return formatter.format(dataNascimento).toString()
    }
}
