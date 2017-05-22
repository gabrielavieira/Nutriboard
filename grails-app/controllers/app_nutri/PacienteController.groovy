package app_nutri

import enums.DiaSemana
import enums.Genero
import enums.Patologia
import enums.PerfilPaciente
import enums.StatusPeso
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
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

    def editaModelPadrao(model, entityInstance){
        List anamneses = new ArrayList<>( Anamnese.findAllByPaciente( entityInstance, [sort: "data"] ) )
        List avaliacoesAntropometricas = new ArrayList<>( AvaliacaoAntropometrica.findAllByPaciente( entityInstance, [sort: "data"] ) )
        List planosAlimentares =  new ArrayList<>( PlanoAlimentar.findAllByPaciente( entityInstance, [sort: "data"] ) )

        model.put("patologias", Patologia.values() )
        model.put("anamneseAtual", anamneses != null && anamneses.size() > 0 ? anamneses.first() : null )
        model.put("antropometriaAtual", avaliacoesAntropometricas != null && avaliacoesAntropometricas.size() > 0 ? avaliacoesAntropometricas.first() : null )
        model.put("planoAlimentarAtual", planosAlimentares != null && planosAlimentares.size() > 0 ? planosAlimentares.first() : null )

        return model
    }

    def getIMC(){
        def resultado = [:]
        BigDecimal altura = params.altura ? new BigDecimal( params.altura ) : null
        BigDecimal peso = params.peso ? new BigDecimal( params.peso ) : null

        if( altura && peso ){
            BigDecimal alturaEmMetros = altura/100
            BigDecimal imc = (peso/(alturaEmMetros*alturaEmMetros)).setScale( 2, RoundingMode.HALF_EVEN )
            StatusPeso statusPeso = getConclusaoSobrePeso(imc)
            resultado.put( "imc", imc )
            resultado.put( "conclusao", message( code: 'ennumeration.statusPeso.' + statusPeso )  )
            resultado.put( "corSpan", getCorSpan( statusPeso )  )
        }

        render resultado as JSON
    }

    def getCorSpan( statusPeso ){
        String resultado = ""
        if( statusPeso.equals( StatusPeso.NORMAL ) ){
            resultado = "success"
        }else if( statusPeso.equals( StatusPeso.ABAIXO ) || statusPeso.equals( StatusPeso.ACIMA ) ){
            resultado = "warning"
        }else{
            resultado = "danger"
        }

        return resultado
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
        }else{
            status = StatusPeso.OBESIDADE_2
        }

        return status.name()
    }

    def adicionarRefeicao(){
        def model = [:]
        Paciente paciente = Paciente.get(params.idPaciente)
        PlanoAlimentar plano = PlanoAlimentar.get(params.id)
        Refeicao refeicao = new Refeicao( horario: params.horario, observacao: params.observacao )
        PlanoDiario planoDiario = new PlanoDiario( dia: params.dia as DiaSemana)
        planoDiario.addToRefeicoes( refeicao )
        plano.addToPlanosDiarios( planoDiario )
        if( plano.save() ){
            flash.message = "Sucesso!"
        }else{
            flash.error = "Erro!"
        }

        print plano.errors
        model.put("paciente", paciente)

        render( template: "perfilPaciente", model: editaModelPadrao(model,paciente) )
    }

    PlanoAlimentar getPlanoAlimentar(){
        print params
        PlanoAlimentar planoAlimentar
        if( params.idPlanoAlimentar ){
            planoAlimentar = PlanoAlimentar.get(params.idPlanoAlimentar)
            planoAlimentar.planosDiarios.clear()
        }else{
            planoAlimentar = new PlanoAlimentar( data: new Date(), descricao: params.descricao)
        }

        DiaSemana.values().each { dia ->
            PlanoDiario planoDiario = new PlanoDiario( dia: dia )
            def refeicoes = params.get('refeicoes['+ dia +']') as String
            def listaDeRefeicoes = refeicoes != null && refeicoes != "" ? Eval.me( refeicoes ) : new ArrayList<>()
            listaDeRefeicoes?.each{ idRefeicao -> planoDiario.addToRefeicoes( Refeicao.get( idRefeicao ) ) }

            if( listaDeRefeicoes != null && listaDeRefeicoes.size() > 0 )
                planoAlimentar.addToPlanosDiarios( planoDiario )
        }

        return planoAlimentar
    }

    def criarRefeicao(){
        print params
        Refeicao refeicao = Refeicao.newInstance( params )
        refeicao.save(flush: true)
        print refeicao.errors
        render refeicao as JSON
    }

    def deletarPaciente(){
        Paciente paciente = Paciente.get(params.id)
        if(paciente?.delete( flush: true ))
            flash.message = message(code: 'paciente.excluido.label')

        def model = [:]
        model.put("entityInstance", entity.newInstance(params))
        model.put("template", "preCadastro" )

        render(template: "preCadastro", model: editaModelPadrao(model, null))
    }

    def getImagemPerfil(){
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request
        MultipartFile file = null
        Arquivo arquivo = null

        file = mRequest.getFile( 'imgPerfilPaciente' )

        if(file != null){
            arquivo = new Arquivo()
            arquivo.nomeArquivo = file.getOriginalFilename()
            arquivo.arquivo = file.getBytes()
        }

        arquivo.save( flush: true )

        return arquivo
    }

    Anamnese getUltimaAnamnese( Paciente paciente ){
        List anamneses = new ArrayList<>( Anamnese.findAllByPaciente( paciente, [sort: "data"] ) )
        return anamneses != null && anamneses.size() > 0 ? anamneses.first() : null
    }

    AvaliacaoAntropometrica getUltimaAvaliacaoAntropometrica( Paciente paciente ){
        List avaliacoesAntropometricas = new ArrayList<>( AvaliacaoAntropometrica.findAllByPaciente( paciente, [sort: "data"] ) )
        return avaliacoesAntropometricas != null && avaliacoesAntropometricas.size() > 0 ? avaliacoesAntropometricas.first() : null
    }

    PlanoAlimentar getUltimoPlanoAlimentar( Paciente paciente ){
        List planos = new ArrayList<>( PlanoAlimentar.findAllByPaciente( paciente, [sort: "data"] ) )
        return planos != null && planos.size() > 0 ? planos.first() : null
    }

    def imagemPerfilPaciente() {
        if(params?.idImagem){
            Arquivo arquivo = Arquivo.get(params?.idImagem)
            response.contentType = arquivo.getContentType()
            response.outputStream << arquivo?.arquivo
            response.outputStream.flush()
        }
    }

    PlanoAlimentar getPlanoAlimentarDoPerfilSemelhante( Paciente pacienteAtual ){
        Anamnese anamneseAtual = getUltimaAnamnese(pacienteAtual)
        AvaliacaoAntropometrica avaliacaoAntropometrica = getUltimaAvaliacaoAntropometrica(pacienteAtual)
        Paciente pacienteSimiliar
        if( anamneseAtual ){
            if(anamneseAtual.patologias != null && anamneseAtual.patologias.size() > 0){
                //TODO: Filtrar
                pacienteSimiliar = Paciente.findByNome("Exemplo Paciente Diabético")
            }
        }
        if( avaliacaoAntropometrica ){
            //TODO: Filtrar
            if( avaliacaoAntropometrica.statusPeso.equals(StatusPeso.NORMAL) ){
                pacienteSimiliar = Paciente.findByNome("Paciente Peso Normal")
            }else if( avaliacaoAntropometrica.statusPeso.equals(StatusPeso.ACIMA) ){
                pacienteSimiliar = Paciente.findByNome("Exemplo Paciente Acima do Peso")
            }
        }
        PlanoAlimentar planoPacienteSimiliar = getUltimoPlanoAlimentar( pacienteSimiliar )
        PlanoAlimentar planoSugerido = planoPacienteSimiliar.clonar( planoPacienteSimiliar )

        return planoSugerido
    }
}
