<%@ page import="app_nutri.Atividade" %>
<!-- TO DO List -->
<div class="box box-primary">
    <div class="box-header">
        <i class="ion ion-clipboard"></i>
        <h3 class="box-title">Atividades</h3>

        <div class="box-tools pull-right">
            <ul class="pagination pagination-sm inline">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <ul class="todo-list">
            <g:each in="${app_nutri.Atividade.list()}" var="atividade">
                <li>
                    <!-- drag handle -->
                    <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                    </span>
                    <!-- checkbox -->
                    <input type="checkbox" value="">
                    <span class="text"> ${atividade?.descricao} </span>
                </li>
            </g:each>
        </ul>
    </div>
    <!-- /.box-body -->
    <div class="box-footer clearfix no-border">
        <button type="button" class="btn btn-danger pull-right btn-sm" data-toggle="modal" data-target="#modalCadastroAtividade"><i class="fa fa-plus"></i> Adicionar</button>
    </div>
</div>
<!-- /.box -->