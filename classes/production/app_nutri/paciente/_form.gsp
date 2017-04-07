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
                    <li class="active"><a href="#anamnese" data-toggle="tab">Anamnese</a></li>
                    <li><a href="#tab2" data-toggle="tab">Avaliação Antropométrica</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="anamnese">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Hábitos de Vida
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> Fumante
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> Ingere bebida alcoólica
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Patologia
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <g:each in="${patologias}" var="patologia">
                                            <div class="col-md-2">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="patologia"> <g:message code="paciente.patologia.${patologia}.label"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </g:each>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Hábitos Alimentares
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="suplementos"><g:message code="paciente.habitosAlimentares.suplementos.label"/></label>
                                            <textarea class="form-control" rows="5" id="suplementos" name="suplementos"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="alergiaAlimentar"><g:message code="paciente.habitosAlimentares.alergiaAlimentar.label"/></label>
                                            <textarea class="form-control" rows="5" id="alergiaAlimentar" name="alergiaAlimentar"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="intoleranciaAlimentar"><g:message code="paciente.habitosAlimentares.intoleranciaAlimentar.label"/></label>
                                            <textarea class="form-control" rows="5" id="intoleranciaAlimentar" name="intoleranciaAlimentar"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab2">
                        <p>Estou na seção de avaliação antropométrica.</p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>