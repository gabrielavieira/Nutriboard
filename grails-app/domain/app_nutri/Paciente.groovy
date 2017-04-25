package app_nutri

import enums.Genero

import java.text.DateFormat
import java.text.SimpleDateFormat

class Paciente {

    String nome
    Genero genero
    String cpf
    Date dataNascimento
    String email
    Boolean ativo

    static hasMany = [avaliacoesAntropometricas : AvaliacaoAntropometrica, anamneses: Anamnese]

    static constraints = {
        avaliacoesAntropometricas nullable: true
        anamneses nullable: true
    }

    static mapping = {
        avaliacoesAntropometricas cascade: 'all-delete-orphan'
    }

    String getDataFormatada(){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        return formatter.format(dataNascimento != null ? dataNascimento : new Date()).toString()
    }

    Integer getIdade() {
        long ageInMillis = new Date().getTime() - dataNascimento.getTime()
        Date age = new Date(ageInMillis)
        return age.getYear()
    }
}
