<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <asset:javascript src="application.js"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body>

<!-- Main Header -->
<header class="main-header">
    <nav class="navbar navbar-inverse ajNavBar">



        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="/">NutriBoard</a>
            </div>

            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Cadastros <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${createLink(controller: 'paciente', action: 'index')}">
                                    <g:message code="cadastro.menu.item.paciente.label"/>
                                </a>
                            </li>
                            <li>
                                <a href="${createLink(controller: 'receita', action: 'index')}">
                                    <g:message code="cadastro.menu.item.receita.label"/>
                                </a>
                            </li>
                            <li>
                                <a href="${createLink(controller: 'avaliacaoAntropometrica', action: 'index')}">
                                    <g:message code="cadastro.menu.item.avaliacaoAntropometrica.label"/>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-right">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </form>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>

    <g:layoutBody/>

    <aside class="main-sidebar ">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu skin-black-light">
                <li class="header">Cadastros</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="active">
                    <a href="${createLink(controller: 'paciente', action: 'index')}">
                        <g:message code="cadastro.menu.item.paciente.label"/>
                    </a>
                </li>
                <li>
                    <a href="${createLink(controller: 'receita', action: 'index')}">
                        <g:message code="cadastro.menu.item.receita.label"/>
                    </a>
                </li>
                <li>
                    <a href="${createLink(controller: 'avaliacaoAntropometrica', action: 'index')}">
                        <g:message code="cadastro.menu.item.avaliacaoAntropometrica.label"/>
                    </a>
                </li>
                <li class="treeview">

                    <ul class="treeview-menu">
                        <li><a href="#">Link in level 2</a></li>
                        <li><a href="#">Link in level 2</a></li>
                    </ul>
                </li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>
</body>
</html>
