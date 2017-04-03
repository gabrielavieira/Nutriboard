<div  class="container">
    <div class="col-md-12">
        <h3>
            <h2>Cadastro | Paciente</h2>
            <button type="button" class="btn btn-default voltar pull-right" data-controller="paciente">Voltar</button>
        </h3>
    </div>
</div>
<div class="container">
    <form id="formNovo">
        <div class="col-md-5">
            <div class="form-group">
                <label for="nome"><g:message code="paciente.nome.label"/></label>
                <input type="text" class="form-control" id="nome" name="nome" value="${entityInstance?.nome}">
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="genero"><g:message code="paciente.genero.label"/></label>
                <g:select name="genero" class="form-control" from="['FEMININO', 'MASCULINO']" value="${entityInstance?.genero}" />
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group data">
                <label for="dtNascimento"><g:message code="paciente.dataNascimento.label"/></label>
                <input type="text" class="form-control" id="dtNascimento" name="dtNascimento" value="${entityInstance?.getDataFormatada()}">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="email"><g:message code="paciente.email.label"/></label>
                <input type="email" class="form-control" id="email" name="email" value="${entityInstance?.email}">
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label for="cpf"><g:message code="paciente.CPF.label"/></label>
                <input type="text" class="form-control" id="cpf" name="cpf" value="${entityInstance?.cpf}">
            </div>
        </div>
        <div class="col-md-3">
            <div class="ajBtnsemlabel"></div>
            <button type="button" class="btn btn-danger salvar" data-controller="paciente">Salvar</button>
        </div>
        <div class="col-md-12">
            <div class="tabbable"> <!-- Only required for left/right tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab1" data-toggle="tab">Anamnese</a></li>
                    <li><a href="#tab2" data-toggle="tab">Avaliação Antropométrica</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab1">
                        <p>Estou na seção de anamnese.</p>
                    </div>
                    <div class="tab-pane" id="tab2">
                        <p>Estou na seção de avaliação antropométrica.</p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>