<div  class="container">
    <div class="col-md-12">
        <h3>
            <h2>Cadastro | Alimento</h2>
            <button type="button" class="btn btn-default voltar pull-right" data-controller="alimento">Voltar</button>
        </h3>
    </div>
</div>
<div class="container">
    <form id="formNovo">
        <div class="form-group col-md-4">
            <label for="descricao"><g:message code="alimento.descricao.label"/></label>
            <input type="text" class="form-control" id="descricao" name="descricao" value="${entityInstance?.descricao}">
        </div>
        <div class="form-group col-md-2">
            <label for="porcao"><g:message code="alimento.porcao.label"/></label>
            <div class="input-group">
                <input type="text" class="form-control" id="porcao" name="porcao" value="${entityInstance?.porcao}">
                <div class="input-group-addon" >g</div>
            </div>
        </div>
        <div class="form-group col-md-2">
            <label for="valorCalorico"><g:message code="alimento.valorCalorico.label"/></label>
            <div class="input-group">
                <input type="text" class="form-control" id="valorCalorico" name="valorCalorico" value="${entityInstance?.valorCalorico}">
                <div class="input-group-addon" >Kcal</div>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label for="grupoAlimentar"><g:message code="alimento.grupoAlimentar.label"/></label>
            <g:select name="grupoAlimentar" from="${enums.GrupoAlimentar.values()}" class="form-control" value="${entityInstance?.grupoAlimentar}"/>
        </div>
        <div class="form-group col-md-1">
            <div class="ajBtnsemlabel"></div>
            <button type="button" class="btn btn-danger salvar" data-controller="alimento">Salvar</button>
        </div>
    </form>
</div>