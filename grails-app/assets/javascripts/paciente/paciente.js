var salvarPreCadastro;
var salvarAnamnese;
var salvarAvaliacaoAntropometrica;
var salvarPlanoAlimentar;
var atualizarIMC;
var abrirModalParaCadastroRefeicao;
var adicionarRefeicao;

window.onload = function()
{
    jQuery(document).delegate( "#btnSalvarPreCadastro", "click", salvarPreCadastro );
    jQuery(document).delegate( "#btnSalvarAnamnese", "click", salvarAnamnese );
    jQuery(document).delegate( "#btnSalvarAvaliacaoAntropometrica", "click", salvarAvaliacaoAntropometrica );
    jQuery(document).delegate( "#btnSalvarPlanoAlimentar", "click", salvarPlanoAlimentar );
    jQuery(document).delegate( "#altura,#pesoAtual", "change", atualizarIMC );
    jQuery(document).delegate( ".abrirModalParaCadastrarRefeicao", "click", abrirModalParaCadastroRefeicao );
    jQuery(document).delegate( "#btnAdicionarRefeicao", "click", adicionarRefeicao );

    carregaDatepicker();
    $("#inputUploadArquivo").fileinput();

    jQuery( document ).ajaxStop( function()
    {
        carregaDatepicker();
        $("#inputUploadArquivo").fileinput();
    });
};

salvarPreCadastro = function () {
    jQuery.ajax
    ({
        url: "/paciente/save",
        type: "POST",
        data : $( '#formNovo' ).find( 'input,select,textarea' ).serialize(),
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

salvarAnamnese = function () {
    jQuery.ajax
    ({
        url: "/paciente/save",
        type: "POST",
        data : $( '[name=formAnamnese]' ).find( 'input,select,textarea' ).serialize(),
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

salvarAvaliacaoAntropometrica = function () {
    jQuery.ajax
    ({
        url: "/paciente/save",
        type: "POST",
        data : $( '[name=formAvaliacaoAntropometrica]' ).find( 'input,select,textarea' ).serialize(),
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

salvarPlanoAlimentar = function () {
    jQuery.ajax
    ({
        url: "/paciente/save",
        type: "POST",
        data : $( '[name=formPlanoAlimentar]' ).find( 'input,select,textarea' ).serialize(),
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

atualizarIMC = function () {
    var altura = jQuery('#altura').val();
    var peso = jQuery('#pesoAtual').val();
    jQuery.ajax
    ({
        url: "/paciente/getIMC",
        type: "POST",
        data : {altura: altura, peso: peso},
        success: function ( data ) {
            jQuery('[name=imc]').val(data.imc);
            jQuery('#conclusaoIMC').text(data.conclusao);
        }
    });
};

abrirModalParaCadastroRefeicao = function () {
    var diaSemanaSelecionado = jQuery(this).attr("data-dia");
    jQuery('#btnAdicionarRefeicao').attr("data-dia", diaSemanaSelecionado);
    $('#modalCadastroReceita').modal();
};

adicionarRefeicao = function () {
    var diaSemanaSelecionado = jQuery(this).attr("data-dia");
};