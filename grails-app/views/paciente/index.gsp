<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title><g:message code="paciente.label"/></title>
        <asset:stylesheet src="bootstrap-datepicker3.css"/>
        <asset:javascript src="paciente/paciente.js"/>
        <asset:javascript src="plugins/Chart.js"/>
        <asset:stylesheet src="plugins/fileinput.css"/>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div id="conteudo" class="wrapper ajWrapper">
            <g:render template="${template}"/>
        </div>
    </body>
    <asset:javascript src="plugins/fileinput.js"/>
    <asset:javascript src="plugins/fileinput_locale_pt-BR.js"/>
</html>