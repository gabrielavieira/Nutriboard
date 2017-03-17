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

window.onload = function()
{
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