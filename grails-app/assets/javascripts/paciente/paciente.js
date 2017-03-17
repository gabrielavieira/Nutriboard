var salvar;
var novo;
var pesquisar;
var editar;
var excluir;

window.onload = function()
{
    jQuery(document).delegate( ".salvar", "click", salvar);
    jQuery(document).delegate( ".novo", "click", novo);
    jQuery(document).delegate( ".pesquisar", "click", pesquisar);
    jQuery(document).delegate( ".voltar", "click", pesquisar);
    jQuery(document).delegate( ".editar", "click", editar);
    jQuery(document).delegate( ".excluir", "click", excluir);

    carregaDatepicker();

    jQuery( document ).ajaxStop( function()
    {
        carregaDatepicker();
    });
};

function carregaDatepicker(){
    jQuery('.data input').datepicker({
        format: "dd/mm/yyyy",
        language: "pt-BR",
        todayBtn: "linked",
        autoclose: true
    });
};

salvar = function () {
    var nome = $('[name=nome]').val();
    var dataNascimento = $('[name=dataNascimento]').val();
    var email = $('[name=email]').val();
    var cpf = $('[name=cpf]').val();
    jQuery.ajax
    ({
        url: "/paciente/save",
        type: "POST",
        data: { nome: nome, dtNascimento: dataNascimento, email: email, cpf: cpf },
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

novo = function () {
    jQuery.ajax
    ({
        url: "/paciente/novo",
        type: "POST",
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

pesquisar = function () {
    var nome = $('[name=nome]').val();
    var email = $('[name=email]').val();

    jQuery.ajax
    ({
        url: "/paciente/list",
        data: { nome: nome, email: email },
        type: "POST",
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

editar = function () {
    console.log("editar!!");
};

excluir = function () {
    console.log("excluir!!");
};