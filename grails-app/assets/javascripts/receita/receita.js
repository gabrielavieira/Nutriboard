var salvar;
var novo;
var pesquisar;

window.onload = function()
{
    jQuery(document).delegate( ".salvar", "click", salvar);
    jQuery(document).delegate( ".novo", "click", novo);
    jQuery(document).delegate( ".pesquisar", "click", pesquisar);
    jQuery(document).delegate( ".voltar", "click", pesquisar);

};

salvar = function () {
    var nome = $('[name=nome]').val();
    var descricao = $('[name=descricao]').val();
    jQuery.ajax
    ({
        url: "/receita/save",
        type: "POST",
        data: { nome: nome, descricao: descricao },
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

novo = function () {
    console.log("here");
    jQuery.ajax
    ({
        url: "/receita/novo",
        type: "POST",
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

pesquisar = function () {
    var nome = $('[name=nome]').val();

    jQuery.ajax
    ({
        url: "/receita/list",
        data: { nome: nome },
        type: "POST",
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};