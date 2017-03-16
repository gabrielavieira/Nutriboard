<div  class="container">
    <div class="col-md-12">
        <h3>
            Pesquisa de:
            <span class="identBloco">Paciente</span>
            <button type="button" class="btn btn-default novo pull-right">Novo</button>
        </h3>
    </div>
</div>

<div class="container">
    <div class="col-md-2">
        <div class="form-group">
            <label for="nome"><g:message code="paciente.nome.label"/></label>
            <input type="text" class="form-control" id="nome" name="nome" value="${entityInstance?.nome}">
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group">
            <label for="email"><g:message code="paciente.email.label"/></label>
            <input type="email" class="form-control" id="email" name="email" value="${entityInstance?.email}">
        </div>
    </div>
    <div>
        <div class="form-group">
            <div class="ajBtnsemlabel"></div>
            <button type="button" class="btn btn-danger salvar">Pesquisar</button>
        </div>
    </div>
</div>
<div class="container">
    <div class="container">
        <table class="table">
            <thead class="thead-inverse">
                <tr>
                    <th><g:message code="paciente.nome.label"/></th>
                    <th><g:message code="paciente.email.label"/></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${entityInstanceList}" var="entityInstance" status="i">
                <tr>
                    <td>${entityInstance.nome}</td>
                    <td>${entityInstance.email}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>