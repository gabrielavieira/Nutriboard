<g:render template="msgs"/>
<div class="content-wrapper ajContentWrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <!-- Profile Image -->
                <div class="col-md-12 nopad">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle" src="${resource(dir: "images/", file: "circulo.png")}" alt="User profile picture">

                            <h3 class="profile-username text-center">${paciente?.nome}</h3>

                            <p class="text-muted text-center">
                                <span class="label label-warning"><g:message code="ennumeration.perfilPaciente.${paciente?.perfilPaciente}"/></span>
                            </p>

                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>Idade</b> <a class="pull-right"> ${paciente?.getIdade()} anos</a>
                                </li>
                                <li class="list-group-item">
                                    <b>Altura</b> <a class="pull-right"> ${antropometriaAtual?.altura} m</a>
                                </li>
                                <li class="list-group-item">
                                    <b>Peso</b> <a class="pull-right"> ${antropometriaAtual?.pesoAtual} Kg</a>
                                </li>
                            </ul>

                            <a href="#" class="btn btn-primary btn-block"><b>OK</b></a>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                %{--<div class="col-md-12 nopad">--}%
                    %{--<div class="box box-default">--}%
                        %{--<div class="box-header with-border">--}%
                            %{--<h3 class="box-title">Composição Corporal</h3>--}%

                            %{--<div class="box-tools pull-right">--}%
                                %{--<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>--}%
                                %{--</button>--}%
                                %{--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                        %{--<!-- /.box-header -->--}%
                        %{--<div class="box-body">--}%
                            %{--<div class="row">--}%
                                %{--<div class="col-md-8">--}%
                                    %{--<div class="chart-responsive">--}%
                                        %{--<canvas id="pieChart" height="180" width="205" style="width: 205px; height: 180px;"></canvas>--}%
                                    %{--</div>--}%
                                    %{--<!-- ./chart-responsive -->--}%
                                %{--</div>--}%
                                %{--<!-- /.col -->--}%
                                %{--<div class="col-md-4">--}%
                                    %{--<ul class="chart-legend clearfix">--}%
                                        %{--<li><i class="fa fa-circle-o text-red"></i> Peso Gordo</li>--}%
                                        %{--<li><i class="fa fa-circle-o text-green"></i> Peso Residual</li>--}%
                                        %{--<li><i class="fa fa-circle-o text-yellow"></i> Peso Magro</li>--}%
                                        %{--<li><i class="fa fa-circle-o text-aqua"></i> Peso Ósseo</li>--}%
                                    %{--</ul>--}%
                                %{--</div>--}%
                                %{--<!-- /.col -->--}%
                            %{--</div>--}%
                            %{--<!-- /.row -->--}%
                        %{--</div>--}%
                        %{--<!-- /.box-body -->--}%
                        %{--<div class="box-footer no-padding">--}%
                            %{--<ul class="nav nav-pills nav-stacked">--}%
                                %{--<li><a href="#">United States of America--}%
                                    %{--<span class="pull-right text-red"><i class="fa fa-angle-down"></i> 12%</span></a></li>--}%
                                %{--<li><a href="#">India <span class="pull-right text-green"><i class="fa fa-angle-up"></i> 4%</span></a>--}%
                                %{--</li>--}%
                                %{--<li><a href="#">China--}%
                                    %{--<span class="pull-right text-yellow"><i class="fa fa-angle-left"></i> 0%</span></a></li>--}%
                            %{--</ul>--}%
                        %{--</div>--}%
                        %{--<!-- /.footer -->--}%
                    %{--</div>--}%
                %{--</div>--}%
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#anamnese" data-toggle="tab" aria-expanded="true">Anamnese</a></li>
                        <li class=""><a href="#avaliacaoAntropometrica" data-toggle="tab" aria-expanded="false">Avaliação Antropométrica</a></li>
                        <li class=""><a href="#planoAlimentar" data-toggle="tab" aria-expanded="false">Plano Alimentar</a></li>
                        <li class=""><a href="#recordatorioAlimentar" data-toggle="tab" aria-expanded="false">Recordatório Alimentar</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-- INÍCIO ABA ANAMNESE -->
                        <div class="tab-pane active" id="anamnese">
                            <form name="formAnamnese">
                                <input type="hidden" name="id" value="${paciente?.id}">
                                <input type="hidden" name="cadastroAnamnese" value="${true}">
                                <div class="panel-group" role="tablist" aria-multiselectable="true">
                                    <div class="form-group col-md-3 data nopad">
                                        <div class="form-group data">
                                            <label for="dtAnamnese">Data</label>
                                            <input type="text" class="form-control" id="dtAnamnese" name="dtAnamnese" value="${new Date().format("dd/MM/yyyy")}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="ajBtnsemlabel"></div>
                                        <button id="btnSalvarAnamnese" type="button" class="btn btn-danger">Salvar</button>
                                    </div>
                                </div>
                                <div class="panel-group" role="tablist" aria-multiselectable="true">
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
                                                        <input type="checkbox" name="isFumante" ${anamneseAtual?.habitoDeVida?.isFumante ?  'checked' : ''}> Fumante
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="isAlcoolatra" ${anamneseAtual?.habitoDeVida?.isAlcoolatra ?  'checked' : ''}> Ingere bebida alcoólica
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
                                                                <input type="checkbox" value="${patologia}" name="patologias" ${anamneseAtual?.patologias?.contains(patologia) ? 'checked' : ''}> <g:message code="paciente.patologia.${patologia}.label"/>
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
                                                    <textarea class="form-control" rows="5" id="suplementos" name="suplementos">${anamneseAtual?.suplementos}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="alergiaAlimentar"><g:message code="paciente.habitosAlimentares.alergiaAlimentar.label"/></label>
                                                    <textarea class="form-control" rows="5" id="alergiaAlimentar" name="alergiaAlimentar">${anamneseAtual?.alergiaAlimentar}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="intoleranciaAlimentar"><g:message code="paciente.habitosAlimentares.intoleranciaAlimentar.label"/></label>
                                                    <textarea class="form-control" rows="5" id="intoleranciaAlimentar" name="intoleranciaAlimentar">${anamneseAtual?.intoleranciaAlimentar}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- FIM ABA ANAMNESE -->

                        <!-- INÍCIO ABA AVALIAÇÃO ANTROPOMÉTRICA -->
                        <div class="tab-pane" id="avaliacaoAntropometrica">
                            <form name="formAvaliacaoAntropometrica">
                                <input type="hidden" name="id" value="${paciente?.id}">
                                <input type="hidden" name="cadastroAvaliacaoAntropometrica" value="${true}">
                                <div class="panel-group" role="tablist" aria-multiselectable="true">
                                    <div class="form-group col-md-3 data nopad">
                                        <div class="form-group data">
                                            <label for="dtAnamnese">Data</label>
                                            <input type="text" class="form-control" id="dtAvaliacaoAntropometrica" name="dtAvaliacaoAntropometrica" value="${new Date().format("dd/MM/yyyy")}">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-3 nopad">
                                        <label for="dtAnamnese">Altura</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="altura" name="altura" value="${antropometriaAtual?.altura}">
                                            <div class="input-group-addon" >m</div>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-3 nopad">
                                        <label for="dtAnamnese">Peso Atual</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="pesoAtual" name="pesoAtual" value="${antropometriaAtual?.pesoAtual}">
                                            <div class="input-group-addon" >Kg</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="ajBtnsemlabel"></div>
                                        <button id="btnSalvarAvaliacaoAntropometrica" type="button" class="btn btn-danger">Salvar</button>
                                    </div>
                                </div>
                                <div class="panel-group" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="circunferencia">
                                            <h4 class="panel-title">
                                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#conteudoCircunferencias" aria-expanded="true" aria-controls="conteudoCircunferencias">
                                                    Circunferências
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="conteudoCircunferencias" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="circunferencia">
                                            <div class="panel-body">
                                                <div class="col-md-6">
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Ombro</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="ombro" value="${antropometriaAtual?.ombro}">
                                                            <div class="input-group-addon" >cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Peitoral</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="peitoral" value="${antropometriaAtual?.peitoral}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Cintura</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="cintura" value="${antropometriaAtual?.cintura}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Abdomen</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="abdomen" value="${antropometriaAtual?.abdomen}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Quadril</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="quadril" value="${antropometriaAtual?.quadril}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Panturrilha direita</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="panturrilhaDireita" value="${antropometriaAtual?.panturrilhaDireita}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Panturrilha esquerda</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="panturrilhaEsquerda" value="${antropometriaAtual?.panturrilhaEsquerda}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Pescoço</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="pescoco" value="${antropometriaAtual?.pescoco}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Punho</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="punho" value="${antropometriaAtual?.punho}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Coxa Direita</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="coxaDireita" value="${antropometriaAtual?.coxaDireita}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Coxa Esquerda</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="coxaEsquerda" value="${antropometriaAtual?.coxaEsquerda}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Coxa Próximal Direita</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="coxaProximalDireita" value="${antropometriaAtual?.coxaProximalDireita}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Coxa Proximal Esquerda</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="coxaProximalEsquerda" value="${antropometriaAtual?.coxaProximalEsquerda}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Braço Relachado Direito</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="bracoRelaxadoDireito" value="${antropometriaAtual?.bracoRelaxadoDireito}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Braço Relachado Esquerdo</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="bracoRelaxadoEsquerdo" value="${antropometriaAtual?.bracoRelaxadoEsquerdo}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Braço Contraído Direito</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="bracoContraidoDireito" value="${antropometriaAtual?.bracoContraidoDireito}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Braço Contraído Esquerdo</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="bracoContraidoEsquerdo" value="${antropometriaAtual?.bracoContraidoEsquerdo}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Antebraço</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="antebraco" value="${antropometriaAtual?.antebraco}">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="diametrosOsseos">
                                            <h4 class="panel-title">
                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#conteudoDiametrosOsseos" aria-expanded="false" aria-controls="conteudoDiametrosOsseos">
                                                    Diâmetros Ósseos
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="conteudoDiametrosOsseos" class="panel-collapse collapse" role="tabpanel" aria-labelledby="diametrosOsseos">
                                            <div class="panel-body">
                                                <div class="col-md-6">
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Punho</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="diametroOsseoPunho">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Fêmur</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" name="diametroOsseoFemur">
                                                            <div class="input-group-addon">cm</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="composicaoCorporal">
                                            <h4 class="panel-title">
                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#conteudoComposicaoCorporal" aria-expanded="false" aria-controls="conteudoComposicaoCorporal">
                                                    Composição Corporal
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="conteudoComposicaoCorporal" class="panel-collapse collapse" role="tabpanel" aria-labelledby="composicaoCorporal">
                                            <div class="panel-body">
                                                <div class="col-md-6">
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">IMC</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="IMC">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Massa Gorda</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="massaGorda">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Massa Magra</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="massaMagra">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Água Corporal</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="aguaCorporal">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Peso Ósseo</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="pesoOsseo">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Peso Muscular</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="pesoMuscular">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Idade Metabólica</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="idadeMetabolica">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Peso Ideal</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="pesoIdeal">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Massa Gorda</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="massaGorda">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Massa Magra</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="massaMagra">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Água Corporal</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="aguaCorporal">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Peso Residual</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="pesoResidual">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="col-md-6">Gordura Visceral</label>
                                                        <div class="col-md-6">
                                                            <input type="text" class="form-control" name="gorduraVisceral">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- FIM ABA AVALIAÇÃO ANTROPOMÉTRICA -->

                        <!-- INÍCIO ABA PLANO ALIMENTAR -->
                        <div class="tab-pane" id="planoAlimentar">

                        </div>
                        <!-- FIM ABA PLANO ALIMENTAR -->

                        <!-- INÍCIO ABA RECORDATORIO ALIMENTAR -->
                        <div class="tab-pane" id="recordatorioAlimentar">

                        </div>
                        <!-- FIM ABA RECORDATORIO ALIMENTAR -->

                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </div>
    </section>
</div>