<div class="content-wrapper ajContentWrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="${resource(dir: "images/", file: "circulo.png")}" alt="User profile picture">

                        <h3 class="profile-username text-center">${paciente?.nome}</h3>

                        <p class="text-muted text-center"> Perfil do Paciente </p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>Idade</b> <a class="pull-right">${paciente?.getIdade()} anos</a>
                            </li>
                            <li class="list-group-item">
                                <b>Altura</b> <a class="pull-right">1,59 m</a>
                            </li>
                            <li class="list-group-item">
                                <b>Peso</b> <a class="pull-right">55,00 Kg</a>
                            </li>
                        </ul>

                        <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#anamnese" data-toggle="tab" aria-expanded="true">Anamnese</a></li>
                        <li class=""><a href="#avaliacaoAntropometrica" data-toggle="tab" aria-expanded="false">Avaliação Antropométrica</a></li>
                        <li class=""><a href="#settings" data-toggle="tab" aria-expanded="false">Settings</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-- INÍCIO ABA ANAMNESE -->
                        <div class="tab-pane active" id="anamnese">
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
                        </div>
                        <!-- FIM ABA ANAMNESE -->

                        <!-- INÍCIO ABA AVALIAÇÃO ANTROPOMÉTRICA -->
                        <div class="tab-pane" id="avaliacaoAntropometrica">
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
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="ombro">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Peitoral</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="peitoral">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Cintura</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="cintura">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Abdomen</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="abdomen">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Quadril</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="quadril">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Panturrilha direita</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="panturrilhaDireita">
                                                </div>
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Panturrilha esquerda</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="panturrilhaEsquerda">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Pescoço</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="pescoco">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Punho</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="punho">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Ombro</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="ombro">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Peitoral</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="peitoral">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Cintura</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="cintura">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Abdomen</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="abdomen">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Quadril</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="quadril">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Panturrilha direita</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="panturrilhaDireita">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Panturrilha esquerda</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="panturrilhaEsquerda">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Pescoço</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="pescoco">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Punho</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="punho">
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
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="punho">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group col-md-12">
                                                <label class="col-md-6">Fêmur</label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" name="femur">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <!-- FIM ABA AVALIAÇÃO ANTROPOMÉTRICA -->

                        <div class="tab-pane" id="settings">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                                    <div class="col-sm-10">
                                        <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-danger">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
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