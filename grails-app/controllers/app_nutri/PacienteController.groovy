package app_nutri

import grails.converters.JSON

import java.text.DateFormat
import java.text.SimpleDateFormat

class PacienteController extends CRUDController{

    def entity = Paciente

    def query = {
        order( 'nome' )
    }
    @Override
    def beforeSave(entityInstance,model){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        if( params.dtNascimento )
            entityInstance.dataNascimento = (Date)formatter.parse(params.dtNascimento)

        entityInstance.ativo = true
    }

    def teste(){
        def pacientes = Paciente.list()
        render pacientes as JSON
    }
}
