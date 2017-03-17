<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="default.nameApplication.label"/></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    %{--<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">--}%
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    %{--<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">--}%
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    %{--<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">--}%

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    %{--<aside class="main-sidebar ajMainSideBar">--}%
        %{--<!-- sidebar: style can be found in sidebar.less -->--}%
        %{--<section class="sidebar">--}%
            %{--<!-- sidebar menu: : style can be found in sidebar.less -->--}%
            %{--<ul class="sidebar-menu">--}%
                %{--<li class="treeview">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-dashboard"></i> <span>Dashboard</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>--}%
                        %{--<li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li class="treeview">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-files-o"></i>--}%
                        %{--<span>Layout Options</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<span class="label label-primary pull-right">4</span>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>--}%
                        %{--<li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>--}%
                        %{--<li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>--}%
                        %{--<li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<a href="../widgets.html">--}%
                        %{--<i class="fa fa-th"></i> <span>Widgets</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<small class="label pull-right bg-green">new</small>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                %{--</li>--}%
                %{--<li class="treeview">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-pie-chart"></i>--}%
                        %{--<span>Charts</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>--}%
                        %{--<li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>--}%
                        %{--<li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>--}%
                        %{--<li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li class="treeview">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-laptop"></i>--}%
                        %{--<span>UI Elements</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>--}%
                        %{--<li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>--}%
                        %{--<li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>--}%
                        %{--<li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>--}%
                        %{--<li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>--}%
                        %{--<li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li class="treeview">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-edit"></i> <span>Forms</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li><a href="../forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>--}%
                        %{--<li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>--}%
                        %{--<li><a href="../forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li class="treeview active">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-table"></i> <span>Tables</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li class="active"><a href="simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>--}%
                        %{--<li><a href="data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<a href="../calendar.html">--}%
                        %{--<i class="fa fa-calendar"></i> <span>Calendar</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<small class="label pull-right bg-red">3</small>--}%
                            %{--<small class="label pull-right bg-blue">17</small>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                %{--</li>--}%
                %{--<li>--}%
                    %{--<a href="../mailbox/mailbox.html">--}%
                        %{--<i class="fa fa-envelope"></i> <span>Mailbox</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<small class="label pull-right bg-yellow">12</small>--}%
                            %{--<small class="label pull-right bg-green">16</small>--}%
                            %{--<small class="label pull-right bg-red">5</small>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                %{--</li>--}%
                %{--<li class="treeview">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-folder"></i> <span>Examples</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li><a href="../examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>--}%
                        %{--<li><a href="../examples/profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>--}%
                        %{--<li><a href="../examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>--}%
                        %{--<li><a href="../examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>--}%
                        %{--<li><a href="../examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>--}%
                        %{--<li><a href="../examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>--}%
                        %{--<li><a href="../examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>--}%
                        %{--<li><a href="../examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>--}%
                        %{--<li><a href="../examples/pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li class="treeview">--}%
                    %{--<a href="#">--}%
                        %{--<i class="fa fa-share"></i> <span>Multilevel</span>--}%
                        %{--<span class="pull-right-container">--}%
                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                        %{--</span>--}%
                    %{--</a>--}%
                    %{--<ul class="treeview-menu">--}%
                        %{--<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>--}%
                        %{--<li>--}%
                            %{--<a href="#"><i class="fa fa-circle-o"></i> Level One--}%
                                %{--<span class="pull-right-container">--}%
                                    %{--<i class="fa fa-angle-left pull-right"></i>--}%
                                %{--</span>--}%
                            %{--</a>--}%
                            %{--<ul class="treeview-menu">--}%
                                %{--<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>--}%
                                %{--<li>--}%
                                    %{--<a href="#"><i class="fa fa-circle-o"></i> Level Two--}%
                                        %{--<span class="pull-right-container">--}%
                                            %{--<i class="fa fa-angle-left pull-right"></i>--}%
                                        %{--</span>--}%
                                    %{--</a>--}%
                                    %{--<ul class="treeview-menu">--}%
                                        %{--<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>--}%
                                        %{--<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>--}%
                                    %{--</ul>--}%
                                %{--</li>--}%
                            %{--</ul>--}%
                        %{--</li>--}%
                        %{--<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>--}%
                    %{--</ul>--}%
                %{--</li>--}%
                %{--<li><a href="../../documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>--}%
                %{--<li class="header">LABELS</li>--}%
                %{--<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>--}%
                %{--<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>--}%
                %{--<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>--}%
            %{--</ul>--}%
        %{--</section>--}%
        %{--<!-- /.sidebar -->--}%
    %{--</aside>--}%

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper ajContentWrapper">
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-6">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"> Pacientes </h3>
                            <div class="box-tools">
                                <div class="input-group input-group-sm" style="width: 150px;">
                                    <input type="text" name="email" class="form-control pull-right" placeholder="Email">

                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default pesquisar"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
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
                                        <td><button type="button" class="btn btn-default"><i class="fa fa-eye" aria-hidden="true"></i></button></td>
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
                <div class="col-md-6">
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
                                <li>
                                    <!-- drag handle -->
                                    <span class="handle">
                                        <i class="fa fa-ellipsis-v"></i>
                                        <i class="fa fa-ellipsis-v"></i>
                                    </span>
                                    <!-- checkbox -->
                                    <input type="checkbox" value="">
                                    <!-- todo text -->
                                    <span class="text">Pesquisar sobre Alimentos que auxiliam pessoas diabéticas.</span>
                                    <!-- Emphasis label -->
                                    <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
                                    <!-- General tools such as edit or delete-->
                                    <div class="tools">
                                        <i class="fa fa-edit"></i>
                                        <i class="fa fa-trash-o"></i>
                                    </div>
                                </li>
                                <li>
                                    <span class="handle">
                                        <i class="fa fa-ellipsis-v"></i>
                                        <i class="fa fa-ellipsis-v"></i>
                                    </span>
                                    <input type="checkbox" value="">
                                    <span class="text">Avaliar o andamento geral dos pacientes.</span>
                                    <small class="label label-info"><i class="fa fa-clock-o"></i> 4 hours</small>
                                    <div class="tools">
                                        <i class="fa fa-edit"></i>
                                        <i class="fa fa-trash-o"></i>
                                    </div>
                                </li>
                                <li>
                                    <span class="handle">
                                        <i class="fa fa-ellipsis-v"></i>
                                        <i class="fa fa-ellipsis-v"></i>
                                    </span>
                                    <input type="checkbox" value="">
                                    <span class="text">Este é um teste de atividade.</span>
                                    <small class="label label-warning"><i class="fa fa-clock-o"></i> 1 day</small>
                                    <div class="tools">
                                        <i class="fa fa-edit"></i>
                                        <i class="fa fa-trash-o"></i>
                                    </div>
                                </li>
                                <li>
                                    <span class="handle">
                                        <i class="fa fa-ellipsis-v"></i>
                                        <i class="fa fa-ellipsis-v"></i>
                                    </span>
                                    <input type="checkbox" value="">
                                    <span class="text">Resposta para o universo e tudo mais: 42.</span>
                                    <small class="label label-success"><i class="fa fa-clock-o"></i> 3 days</small>
                                    <div class="tools">
                                        <i class="fa fa-edit"></i>
                                        <i class="fa fa-trash-o"></i>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix no-border">
                            <button type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add item</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
    </div>
</div>
<!-- ./wrapper -->
</body>
</html>

