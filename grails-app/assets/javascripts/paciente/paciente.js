var salvar;

window.onload = function()
{
    jQuery(document).delegate( ".salvar", "click", salvar);

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
    console.log( "salvar" );
    jQuery.ajax
    ({
        url: "/paciente/save",
        type: "POST",
        data: { nome: nome, dtNascimento: dataNascimento, email: email },
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};