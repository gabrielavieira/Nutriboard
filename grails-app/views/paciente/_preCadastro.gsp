<div  class="container">
    <div class="col-md-12">
        <h3>
            <h2>Cadastro | Paciente</h2>
            <button type="button" class="btn btn-default voltar pull-right" data-controller="paciente">Voltar</button>
        </h3>
    </div>
</div>
<div class="container">
    %{--<form id="formNovo">--}%
    <g:form name="formNovo" url="[action:'save',controller:'paciente']">
        <div class="col-md-12 nopad">
            <div class="col-md-5">
                <div class="form-group">
                    <label for="nome"><g:message code="paciente.nome.label"/></label>
                    <input type="text" class="form-control" id="nome" name="nome" value="${entityInstance?.nome}">
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label for="genero"><g:message code="paciente.genero.label"/></label>
                    <g:select name="genero" class="form-control" from="['FEMININO', 'MASCULINO']" value="${entityInstance?.genero}" />
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group data">
                    <label for="dtNascimento"><g:message code="paciente.dataNascimento.label"/></label>
                    <input type="text" class="form-control" id="dtNascimento" name="dtNascimento" value="${entityInstance?.getDataFormatada()}">
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label for="cpf"><g:message code="paciente.CPF.label"/></label>
                    <input type="text" class="form-control" id="cpf" name="cpf" value="${entityInstance?.cpf}">
                </div>
            </div>
        </div>
        <div class="col-md-12 nopad">
            <div class="col-md-4">
                <div class="form-group">
                    <label for="email"><g:message code="paciente.email.label"/></label>
                    <input type="email" class="form-control" id="email" name="email" value="${entityInstance?.email}">
                </div>
            </div>
            <div class="col-md-7">
                <div class="form-group">
                    <label for="cpf"><g:message code="paciente.objetivo.label"/></label>
                    <input type="text" class="form-control" id="objetivo" name="objetivo" value="${entityInstance?.objetivo}">
                </div>
            </div>
        </div>
        <div class="col-md-12 nopad">
            <div class="col-md-3">
                <div class="ajBtnsemlabel"></div>
                <input id="inputUploadArquivo" name="imgPerfilPaciente" type="file" multiple class="file-loading">
            </div>
        </div>
        <div class="col-md-12">
            <div class="ajBtnsemlabel"></div>
            <button id="btnSalvarPreCadastro" type="button" class="btn btn-danger">Salvar</button>
        </div>
    </g:form>
    %{--</form>--}%
</div>