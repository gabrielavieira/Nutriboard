<div  class="container">
    <div class="col-md-12">
        <h3>
            <h2>Pesquisa | Receita</h2>
            <button type="button" class="btn btn-default novo pull-right" data-controller="receita">Nova</button>
        </h3>
    </div>
</div>

<div class="container">
    <div class="col-md-2">
        <div class="form-group">
            <label for="nome"><g:message code="receita.nome.label"/></label>
            <input type="text" class="form-control" id="nome" name="nome" value="${filters?.nome}">
        </div>
    </div>
    <div>
        <div class="form-group">
            <div class="ajBtnsemlabel"></div>
            <button type="button" class="btn btn-danger pesquisar" data-controller="receita">Pesquisar</button>
        </div>
    </div>
</div>
<div class="container">
    <div class="container">
        <table class="table">
            <thead class="thead-inverse">
                <tr>
                    <th><g:message code="receita.nome.label"/></th>
                    <th><g:message code="receita.acoes.label"/></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${entityInstanceList}" var="entityInstance" status="i">
                <tr>
                    <td>${entityInstance.nome}</td>
                    <td>
                        <button type="button" class="btn btn-default visualizar"><i class="fa fa-pencil"></i></button>
                        <button type="button" class="btn btn-danger visualizar"><i class="fa fa-times"></i></button>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>