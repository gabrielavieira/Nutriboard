<div  class="container">
    <div class="col-md-12">
        <h3>
            <h2>Pesquisa | Alimento</h2>
            <button type="button" class="btn btn-default novo pull-right" data-controller="alimento">Novo</button>
        </h3>
    </div>
</div>

<div class="container">
    <div class="col-md-3">
        <div class="form-group">
            <label for="nome"><g:message code="receita.nome.label"/></label>
            <input type="text" class="form-control" id="nome" name="nome" value="${filters?.nome}">
        </div>
    </div>
    <div>
        <div class="form-group">
            <div class="ajBtnsemlabel"></div>
            <button type="button" class="btn btn-danger pesquisar" data-controller="alimento">Pesquisar</button>
        </div>
    </div>
</div>
<div class="container">
    <div class="container">
        <table class="table">
            <thead class="thead-inverse">
                <tr>
                    <th><g:message code="alimento.descricao.label"/></th>
                    <th><g:message code="alimento.porcao.label"/></th>
                    <th><g:message code="alimento.valorCalorico.label"/></th>
                    <th><g:message code="alimento.grupoAlimentar.label"/></th>
                    <th><g:message code="alimento.acoes.label"/></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${entityInstanceList}" var="entityInstance" status="i">
                <tr>
                    <td>${entityInstance.descricao}</td>
                    <td>${entityInstance.porcao}</td>
                    <td>${entityInstance.valorCalorico}</td>
                    <td>${entityInstance.grupoAlimentar}</td>
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