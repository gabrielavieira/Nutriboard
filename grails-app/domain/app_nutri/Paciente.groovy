package app_nutri

import enums.Genero
import enums.PerfilPaciente

import java.text.DateFormat
import java.text.SimpleDateFormat

class Paciente {

    String nome
    Genero genero
    String cpf
    Date dataNascimento
    String email
    Boolean ativo
    Arquivo imagemPerfil
    PerfilPaciente perfilPaciente

    static hasMany = [avaliacoesAntropometricas : AvaliacaoAntropometrica, anamneses: Anamnese, planosAlimentares: PlanoAlimentar]

    static constraints = {
        avaliacoesAntropometricas nullable: true
        anamneses nullable: true
        planosAlimentares nullable: true
        imagemPerfil nullable: true
    }

    static mapping = {
        avaliacoesAntropometricas cascade: 'all-delete-orphan'
    }

    String getDataFormatada(){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
        return formatter.format(dataNascimento != null ? dataNascimento : new Date()).toString()
    }

    Integer getIdade() {
        Date now = new Date()
        long timeBetween = now.getTime() - dataNascimento.getTime()
        double yearsBetween = timeBetween / 3.156e+10
        Integer age = (Integer) Math.floor(yearsBetween)

        return age
    }

    def getPerfilAtualPaciente(){
        //TODO: Temporário
        PerfilPaciente perfil = PerfilPaciente.COMPLETO

        if( anamneses == null || anamneses.isEmpty() )
            perfil = PerfilPaciente.INCOMPLETO
        else if( avaliacoesAntropometricas == null || avaliacoesAntropometricas.isEmpty() )
            perfil = PerfilPaciente.INCOMPLETO

        return perfil
    }
}
