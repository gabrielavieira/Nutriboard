<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="default.nameApplication.label"/></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper ajContentWrapper">
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-8">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title"> Pacientes </h3>
                                <div class="box-tools">
                                    <a class="btn btn-danger novoPaciente pull-right btn-sm" href="${createLink(controller: 'paciente', action:'novo')}" >
                                        <i class="fa fa-plus"></i> Adicionar
                                    </a>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Nome</th>
                                        <th>Email</th>
                                        <th>Status</th>
                                        <th>Ações</th>
                                    </tr>
                                    <g:each in="${app_nutri.Paciente.list()}" var="paciente">
                                        <tr>
                                            <td>${paciente.nome}</td>
                                            <td>${paciente.email}</td>
                                            <td>
                                                <span class="badge bg-${paciente.ativo ? 'green' : 'red'}" >${paciente.ativo ? "Ativo" : "Inativo"}</span>
                                            </td>
                                            <td>
                                                <a class="btn btn-default" href="${createLink(controller: 'paciente', action:'edit', params: [id: paciente.id])}" >
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </g:each>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <ul class="pagination pagination-sm no-margin pull-right">
                                    <li><a href="#">&laquo;</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.box -->
                    </div>
                    <div class="col-md-4" id="atividades">
                        <g:render template="atividade/atividades"/>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <!-- ./wrapper -->

    <!-- Modal Cadastro de Atividade -->
    <div class="modal fade" id="modalCadastroAtividade" tabindex="-1" role="dialog" aria-labelledby="modalCadastroAtividade">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Cadastro Atividade</h4>
                </div>
                <div class="modal-body">
                    <textarea class="form-control" rows="5" id="descricao" name="descricao">${atividade?.descricao}</textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" data-controller="home" id="adicionarAtividade">Salvar</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

