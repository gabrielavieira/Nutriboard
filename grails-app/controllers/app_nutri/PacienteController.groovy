package app_nutri

import java.text.DateFormat
import java.text.SimpleDateFormat

class PacienteController extends CRUDController{

    def entity = Paciente

    def query = {
        print params
        if( params.nome ){
            like("nome", "%" + params.nome + "%" )
        }
        if( params.cpf ){
            ep("cpf", params.cpf )
        }
        if( params.email ){
            like("email", "%" + params.email + "%" )
        }
        order( 'nome' )
    }

    @Override
    beforeSave(entityInstance,model){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        if( params.dtNascimento )
            entityInstance.dataNascimento = (Date)formatter.parse(params.dtNascimento)

        entityInstance.ativo = true
    }

    @Override
    def novo() {
        def model = [entityInstance: entity.newInstance(params)]
        render( view: "index", model: model )
    }

    @Override
    def edit() {
        print params
        def entityInstance = entity.get(params.id)
        def model = [entityInstance: entityInstance]
        render( view: "index", model: model )
    }
}
