package app_nutri

import enums.Genero

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
        print params
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        if( params.dtNascimento )
            entityInstance.dataNascimento = (Date)formatter.parse(params.dtNascimento)

        entityInstance.ativo = true
    }

    def save() {
        def model = [:]
        def entityInstance
        boolean edit = params.id ? true:false
        entityInstance = getInstanceEntity()

        beforeSave( entityInstance, model )
        if( entityInstance.errors.getErrorCount() < 1 && entityInstance.validate() )
        {
            if (entityInstance.save(flush: true)) {
                afterSave(entityInstance,model)
                if(edit){
                    flash.message = message(code: 'default.updated.message')
                }else{
                    flash.message = message(code: 'default.created.message')
                }
            }else{
                if(edit){
                    flash.error = message(code: 'default.dont.updated.message')
                }else{
                    flash.error = message(code: 'default.dont.created.message')
                }
            }
        }

        println entityInstance.errors
        model = editaModelDoSave( model )

        render(template: "perfilPaciente", model: model)
    }

    @Override
    novo() {
        def model = [:]
        model.put("entityInstance", entity.newInstance(params))
        model.put("template", "preCadastro" )
        render( view: "index", model: editaModelPadrao(model) )
    }

    @Override
    edit() {
        def entityInstance = entity.get(params.id)
        def model = [:]
        model.put("entityInstance", entityInstance)
//        model.put("anamneseAtual", Anamnese.findAllByPaciente( entityInstance, [sort: "data"] )?.first() )
        model.put("template", "perfilPaciente" )

        render( view: "index", model: editaModelPadrao(model) )
    }

    Anamnese getAnamnese(){
        Anamnese anamnese = Anamnese.newInstance(params)
        HabitoDeVida habito = new HabitoDeVida()
        habito.isAlcoolatra = params.isAlcoolatra ? true : false
        habito.isFumante = params.isFumante ? true : false
        anamnese.habitoDeVida = habito
        return anamnese
    }

    def editaModelPadrao(model){
        model.put("patologias", Anamnese.getPatologiasDisponiveis() )
        Genero g
        return model
    }

}
