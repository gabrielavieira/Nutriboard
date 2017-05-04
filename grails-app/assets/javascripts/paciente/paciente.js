var salvarPreCadastro;
var salvarAnamnese;
var salvarAvaliacaoAntropometrica;

window.onload = function()
{
    jQuery(document).delegate( "#btnSalvarPreCadastro", "click", salvarPreCadastro );
    jQuery(document).delegate( "#btnSalvarAnamnese", "click", salvarAnamnese );
    jQuery(document).delegate( "#btnSalvarAvaliacaoAntropometrica", "click", salvarAvaliacaoAntropometrica );

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
    console.log("here");
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