package app_nutri

import enums.Genero
import enums.Patologia
import enums.PerfilPaciente
import enums.StatusPeso
import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.math.RoundingMode
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
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
        boolean edit = params.id ? true:false

        if( edit ){
            entityInstance.perfilPaciente = entityInstance.getPerfilAtualPaciente()

            if( params.cadastroAnamnese )
                entityInstance.addToAnamneses( getAnamnese() )

            if( params.cadastroAvaliacaoAntropometrica )
                entityInstance.addToAvaliacoesAntropometricas( getAvaliacaoAntropometrica() )

            if( params.cadastroPlanoAlimentar )
                entityInstance.addToPlanosAlimentares( getPlanoAlimentar() )

        }else{
            entityInstance.perfilPaciente = PerfilPaciente.INCOMPLETO
        }

        if( params.dtNascimento )
            entityInstance.dataNascimento = (Date)formatter.parse(params.dtNascimento)

        if (params.imgPerfilPaciente)
            entityInstance.imagemPerfil = getImagemPerfil()

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
                    flash.message = message(code: 'paciente.msgInstrucaoAposSalvar.label')
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
        model.put( "paciente", entityInstance )

        render(template: "perfilPaciente", model: editaModelPadrao(model, entityInstance))
    }

    @Override
    novo() {
        def model = [:]
        model.put("entityInstance", entity.newInstance(params))
        model.put("template", "preCadastro" )
        render( view: "index", model: editaModelPadrao(model,null) )
    }

    @Override
    edit() {
        def entityInstance = entity.get(params.id)
        def model = [:]

        model.put("paciente", entityInstance)
        model.put("template", "perfilPaciente" )

        render( view: "index", model: editaModelPadrao(model, entityInstance) )
    }

    Anamnese getAnamnese(){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
        Anamnese anamnese = Anamnese.newInstance(params)
        HabitoDeVida habito = new HabitoDeVida()
        habito.isAlcoolatra = params.isAlcoolatra ? true : false
        habito.isFumante = params.isFumante ? true : false
        anamnese.data = (Date)formatter.parse(params.dtAnamnese)
        anamnese.habitoDeVida = habito
        return anamnese
    }

    AvaliacaoAntropometrica getAvaliacaoAntropometrica(){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
        AvaliacaoAntropometrica avaliacaoAntropometrica = AvaliacaoAntropometrica.newInstance(params)
        avaliacaoAntropometrica.data = (Date)formatter.parse(params.dtAvaliacaoAntropometrica)
        return avaliacaoAntropometrica
    }

    PlanoAlimentar getPlanoAlimentar(){
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy")
        PlanoAlimentar planoAlimentar = PlanoAlimentar.newInstance(params)
        planoAlimentar.data = (Date)formatter.parse(params.dtPlanoAlimentar)
        return planoAlimentar
    }

    def editaModelPadrao(model, entityInstance){
        List anamneses = new ArrayList<>( Anamnese.findAllByPaciente( entityInstance, [sort: "data"] ) )
        List avaliacoesAntropometricas = new ArrayList<>( AvaliacaoAntropometrica.findAllByPaciente( entityInstance, [sort: "data"] ) )
        List planosAlimentares = new ArrayList<>( PlanoAlimentar.findAllByPaciente( entityInstance, [sort: "data"] ) )

        model.put("patologias", Patologia.values() )
        model.put("anamneseAtual", anamneses != null && anamneses.size() > 0 ? anamneses.first() : null )
        model.put("antropometriaAtual", avaliacoesAntropometricas != null && avaliacoesAntropometricas.size() > 0 ? avaliacoesAntropometricas.first() : null )
        model.put("planoAlimentarAtual", planosAlimentares != null && planosAlimentares.size() > 0 ? planosAlimentares.first() : null )

        return model
    }

    def getArquivoPorParametro(){
        print params
        if(params.imgPerfilPaciente){
            Arquivo arquivo = new Arquivo()
            CommonsMultipartFile img = params.imgPerfilPaciente
            arquivo.setArquivo(img.bytes)
            arquivo.setNomeArquivo(img.getName())
            arquivo.setTamanho(img.size)
            arquivo.setTipoArquivo(img.contentType)
            return arquivo
        }else{
            return null
        }
    }

    def getImagemPerfil(){
        Arquivo fileUploaded = getArquivoPorParametro()
        Paciente paciente = Paciente.get(params.id)
        Arquivo imagemPerfil = paciente?.imagemPerfil
        if(fileUploaded) {
            if(imagemPerfil){
                imagemPerfil?.arquivo = fileUploaded?.arquivo
                imagemPerfil?.tipoArquivo = fileUploaded?.tipoArquivo
                imagemPerfil?.tamanho = fileUploaded?.tamanho
                imagemPerfil?.nomeArquivo = fileUploaded?.nomeArquivo
            }else{
                imagemPerfil = new Arquivo()
                imagemPerfil?.arquivo = fileUploaded?.arquivo
                imagemPerfil?.tipoArquivo = fileUploaded?.tipoArquivo
                imagemPerfil?.tamanho = fileUploaded?.tamanho
                imagemPerfil?.nomeArquivo = fileUploaded?.nomeArquivo
            }
        }
        return imagemPerfil
    }

    def getIMC(){
        def resultado = [:]
        BigDecimal altura = params.altura ? new BigDecimal( params.altura ) : null
        BigDecimal peso = params.peso ? new BigDecimal( params.peso ) : null

        if( altura && peso ){
            BigDecimal alturaEmMetros = altura/100
            BigDecimal imc = (peso/(alturaEmMetros*alturaEmMetros)).setScale( 2, RoundingMode.HALF_EVEN )
            resultado.put( "imc", imc )
            resultado.put( "conclusao", getConclusaoSobrePeso(imc)  )
        }

        render resultado as JSON
    }

    String getConclusaoSobrePeso( BigDecimal imc ){
        StatusPeso status
        if( imc < new BigDecimal(18.49) ){
            status = StatusPeso.ABAIXO
        }else if( imc < new BigDecimal(24.99) ){
            status = StatusPeso.NORMAL
        }else if( imc < new BigDecimal(29.99) ){
            status = StatusPeso.ACIMA
        }else if( imc < new BigDecimal(34.99) ){
            status = StatusPeso.OBESIDADE_1
        }

        return message( code: 'ennumeration.statusPeso.' + status?.name() )
    }


}
