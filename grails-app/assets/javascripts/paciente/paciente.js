var salvarPreCadastro;
var salvarAnamnese;
var salvarAvaliacaoAntropometrica;
var salvarPlanoAlimentar;
var atualizarIMC;
var abrirModalParaCadastroRefeicao;
var adicionarRefeicao;
var adicionarAlimento;
var removerAlimento;
var removerRefeicao;
var removerPaciente;

window.onload = function()
{
    jQuery(document).delegate( "#btnSalvarPreCadastro", "click", salvarPreCadastro );
    jQuery(document).delegate( "#btnSalvarAnamnese", "click", salvarAnamnese );
    jQuery(document).delegate( "#btnSalvarAvaliacaoAntropometrica", "click", salvarAvaliacaoAntropometrica );
    jQuery(document).delegate( "#btnSalvarPlanoAlimentar", "click", salvarPlanoAlimentar );
    jQuery(document).delegate( "#altura,#pesoAtual", "change", atualizarIMC );
    jQuery(document).delegate( ".abrirModalParaCadastrarRefeicao", "click", abrirModalParaCadastroRefeicao );
    jQuery(document).delegate( "#btnAdicionarRefeicao", "click", adicionarRefeicao );
    jQuery(document).delegate( "#adicionarAlimento", "click", adicionarAlimento );
    jQuery(document).delegate( ".removerAlimento", "click", removerAlimento );
    jQuery(document).delegate( ".removerRefeicao", "click", removerRefeicao );
    jQuery(document).delegate( "#removerPaciente", "click", removerPaciente );

    carregaDatepicker();
    carregarGraficos();
    $("#inputUploadArquivo").fileinput();

    jQuery( document ).ajaxStop( function()
    {
        carregaDatepicker();
        carregarGraficos();
        $("#inputUploadArquivo").fileinput();
    });
};

function carregarGraficos() {
    var ctx = $("#graficoComposicaoCorporal");

    var conteudoComposicao = {
        labels: [
            "Gordo",
            "Residual",
            "Magro",
            "Osseo"
        ],
        datasets: [
            {
                data: [10.88, 11.44, 24.87, 7.98],
                backgroundColor: [
                    "#d73925",
                    "#00a65a",
                    "#00c0ef",
                    "#ffce56"
                ],
                hoverBackgroundColor: [
                    "#d73925",
                    "#00a65a",
                    "#00c0ef",
                    "#ffce56"
                ]
            }]
    };

    var composicaoCorporalChart = new Chart(ctx, {
        type: 'doughnut',
        data: conteudoComposicao,
        options: {
            legend:{
                display : false
            }
        }
    });

};

// salvarPreCadastro = function () {
//     jQuery.ajax
//     ({
//         url: "/paciente/save",
//         type: "POST",
//         data : $( '#formNovo' ).find( 'input,select,textarea' ).serialize(),
//         success: function ( data ) {
//             $('#conteudo').html( data );
//         }
//     });
// };

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
            var span = '<span class="label label-'+ data.corSpan +'" id="conclusaoIMC">'+ data.conclusao +'</span>'
            jQuery('[name=imc]').val(data.imc);
            jQuery('#divStatusPeso').append(span);
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
    jQuery.ajax
    ({
        url: "/paciente/criarRefeicao",
        type: "POST",
        data : $( '#formRefeicao' ).find( 'input,select,textarea' ).serialize(),
        success: function ( data ) {
            jQuery('#table'+diaSemanaSelecionado + ' tbody')
                .append('<tr id="refeicao' + data.id + '">'+
                    '<input type="hidden" name="refeicoes['+ diaSemanaSelecionado +']" value="'+ data.id +'"/>'+
                    '<td>' + data.horario +'</td>'+
                    '<td>' + getDescricaoAlimentos(data.alimentos) +'</td>'+
                    '<td><button type="button" class="btn btn-danger btn-xs removerRefeicao" data-id="' + data.id + '"><i class="fa fa-times"></i></button></td>'+
                    '</tr>');
            cleanAndHideModal();
        }
    });
};

adicionarAlimento = function () {
    var idAlimento = $('[name=alimento]').val();
    jQuery.ajax
    ({
        url: "/alimento/getAlimento",
        type: "POST",
        data : {idAlimento: idAlimento},
        success: function ( data ) {
            $('#tabelaDeAlimentos tbody')
                .append('<tr id="alimento' + data.id + '">'+
                            '<input type="hidden" name="alimentos" value="'+ data.id +'"/>'+
                            '<td>' + data.descricao +'</td>'+
                            '<td>' + data.valorCalorico + '</td>'+
                            '<td><button type="button" class="btn btn-danger btn-xs removerAlimento" data-id="' + data.id + '"><i class="fa fa-times"></i></button></td>'+
                        '</tr>');
        }
    });
};

removerAlimento = function () {
    console.log("here");
    var idAlimento = $(this).attr('data-id');
    console.log(idAlimento);
    jQuery('#alimento'+idAlimento).remove();
};

removerRefeicao = function () {
    var idRefeicao = jQuery(this).attr('data-id');
    jQuery('#refeicao'+idRefeicao).remove();
};

removerPaciente = function () {
    var idPaciente = $(this).attr('data-id');
    jQuery.ajax
    ({
        url: "/paciente/deletarPaciente",
        type: "POST",
        data : {id: idPaciente},
        success: function ( data ) {
            $('#conteudo').html( data );
        }
    });
};

function getDescricaoAlimentos( alimentos ){
    var descricao = "";

    $.each( alimentos, function( index, value ){
        descricao += value.descricao + " Porção: " + value.porcao + " " + value.unidadeMedida.name + "; "
    });

    return descricao
};

function cleanAndHideModal() {
    jQuery('#horario').val('');
    jQuery('#tabelaDeAlimentos tbody').empty();
    jQuery('#modalCadastroReceita').modal('hide');
}

salvarPreCadastro = function() {

    var nome = jQuery('input[name=nome]').val();
    var genero = jQuery( "[name=genero] option:selected" ).val();
    var dtNascimento = jQuery('input[name=dtNascimento]').val();
    var cpf = jQuery('input[name=cpf]').val();
    var email = jQuery('input[name=email]').val();
    var objetivo = jQuery('input[name=objetivo]').val();
    var arquivo = jQuery( 'input[name=imgPerfilPaciente]' ).length > 0 ? jQuery( 'input[name=imgPerfilPaciente]' )[0].files[0] : null;
    var formData = new FormData();

    console.log("data >> " + arquivo);
    console.log("genero >> " + genero);

    formData.append( 'nome', nome );
    formData.append( 'genero', genero );
    formData.append( 'dtNascimento', dtNascimento );
    formData.append( 'cpf', cpf );
    formData.append( 'email', email );

    if(objetivo){
        formData.append('objetivo', objetivo)
    }
    if(arquivo) {
        formData.append('imgPerfilPaciente', arquivo);
    }

    jQuery.ajax(
        {
            url: "/paciente/save",
            type: 'POST',
            data: formData,
            processData: false,
            cache: false,
            contentType: false,
            success: function( data )
            {
                jQuery('#conteudo').html( data );
            },
            error: function( XMLHttpRequest, textStatus, errorThrown )
            {
                console.log( errorThrown );
            }
        });
};
