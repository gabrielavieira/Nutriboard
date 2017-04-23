//= require jquery-2.2.0.min
//= require plugins/sweetalert.min
//= require plugins/bootstrap-datepicker
//= require plugins/bootstrap-datepicker.pt-BR
//= require_tree .
//= require_self

var salvar;
var novo;
var pesquisar;
var editar;
var excluir;
var adicionarAtividade;

window.onload = function()
{
    jQuery(document).delegate( ".salvar", "click", salvar);
    jQuery(document).delegate( ".novo", "click", novo);
    jQuery(document).delegate( ".pesquisar", "click", pesquisar);
    jQuery(document).delegate( ".voltar", "click", pesquisar);
    jQuery(document).delegate( ".editar", "click", editar);
    jQuery(document).delegate( "#adicionarAtividade", "click", adicionarAtividade);

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
    console.log("salvando");
    var controller = $(this).attr('data-controller');
    jQuery.ajax
    ({
        url: "/"+ controller +"/save",
        type: "POST",
        data : $( '#formNovo' ).find( 'input,select,textarea' ).serialize(),
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

novo = function () {
    var controller = $(this).attr('data-controller');
    jQuery.ajax
    ({
        url: "/"+ controller +"/novo",
        type: "POST",
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

pesquisar = function () {
    var controller = $(this).attr('data-controller');
    jQuery.ajax
    ({
        url: "/"+ controller +"/list",
        data: $( '#formPesquisa' ).find( 'input,select' ).serialize(),
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

adicionarAtividade = function () {
    var descricao = $('[name=descricao]').val();

    jQuery.ajax
    ({
        url: "/atividade/save",
        type: "POST",
        data : {descricao: descricao},
        success: function ( data ) {
            $('#atividades').html(data);
            $('#modalCadastroAtividade').modal('hide');
            $('[name=descricao]').val("");
        }
    });
};