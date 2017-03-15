<div class="container">
    <form>
        <div class="form-group">
            <label for="nome"><g:message code="paciente.nome.label"/></label>
            <input type="text" class="form-control" id="nome" name="nome" value="${entityInstance?.nome}">
        </div>
        <div class="form-group data">
            <label for="dataNascimento"><g:message code="paciente.dataNascimento.label"/></label>
            <input type="text" class="form-control" id="dataNascimento" name="dataNascimento" value="${entityInstance?.dataNascimento}">
        </div>
        <div class="form-group">
            <label for="email"><g:message code="paciente.email.label"/></label>
            <input type="email" class="form-control" id="email" name="email" value="${entityInstance?.email}">
        </div>
        <button type="button" class="btn btn-danger salvar">Salvar</button>
    </form>
</div>