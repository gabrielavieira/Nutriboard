package app_nutri

import grails.converters.JSON

class AtividadeController {

    def index() { }

    def save(){
        def model = [:]
        Atividade atividade = Atividade.newInstance( params )

        if( atividade.errors.getErrorCount() < 1 && atividade.validate() )
        {
            if (atividade.save(flush: true)) {
                flash.message = "Registro criado com sucesso"
            }else{
                flash.error = "Não foi possível cadastrar"
            }
        }

        render template: "atividades"
    }
}
