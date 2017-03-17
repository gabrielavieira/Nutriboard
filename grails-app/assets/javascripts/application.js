// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require plugins/bootstrap
//= require plugins/bootstrap.min.js
//= require plugins/bootstrap-datepicker
//= require plugins/bootstrap-datepicker.pt-BR
//= require plugins/jquery.slimscroll.min
//= require plugins/fastclick
//= require_tree .
//= require_self

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
    var controller = $(this).attr('data-controller');
    jQuery.ajax
    ({
        url: "/"+ controller +"/save",
        type: "POST",
        data : $( '#formNovo' ).find( 'input,select' ).serialize(),
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