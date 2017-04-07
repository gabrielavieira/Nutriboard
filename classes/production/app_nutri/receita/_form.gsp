<div  class="container">
    <div class="col-md-12">
        <h3>
            <h2>Cadastro | Receita</h2>
            <button type="button" class="btn btn-default voltar pull-right" data-controller="receita">Voltar</button>
        </h3>
    </div>
</div>
<div class="container">
    <form id="formNovo">
        <div class="form-group">
            <label for="nome"><g:message code="receita.nome.label"/></label>
            <input type="text" class="form-control" id="nome" name="nome" value="${entityInstance?.nome}">
        </div>
        <div class="form-group">
            <label for="descricao"><g:message code="receita.descricao.label"/></label>
            <textarea class="form-control" rows="5" id="descricao" name="descricao" value="${entityInstance?.descricao}"></textarea>
        </div>
        <button type="button" class="btn btn-danger salvar" data-controller="receita">Salvar</button>
    </form>
</div>