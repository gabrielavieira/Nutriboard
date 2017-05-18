<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <title>
        <g:layoutTitle default="Grails"/>
    </title>

    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>
    <nav class="navbar navbar-default ajNavBar">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="/">
                    <img class="" src="${resource(dir: "images/", file: "topo_aplicacao.png")}" alt="Nutriboard" height="30" width="100">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Cadastros <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${createLink(controller: 'receita', action: 'index')}">
                                    <g:message code="cadastro.menu.item.receita.label"/>
                                </a>
                            </li>
                            <li>
                                <a href="${createLink(controller: 'alimento', action: 'index')}">
                                    <g:message code="cadastro.menu.item.alimento.label"/>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <g:layoutBody/>
</body>
</html>
