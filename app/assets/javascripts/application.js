// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require_tree .

$(document).ready(function(){
    $('.card .show-form').click(function () {
        $(this).parent('.car-report-button').children('.report-form-wrapper').show();
        $(this).parent('.car-report-button').children('.report-form-wrapper').addClass("animated fadeIn");
    });
    $('.report-date input').datepicker({
        dateFormat: "dd/mm/yy",
        defaultDate: 0
    });
    var date = $('.report-date input').attr("value");
    //$('.report-date input').datepicker("setDate", date);
    $('.car-report-form .close-form').click(function(){
        $(this).parent('.car-report-form').parent('.report-form-wrapper').hide();
    });
    $('.reports-search-field').datepicker({
        dateFormat: "dd/mm/yy",
        defaultDate: 0
    });
    $('.report-form-wrapper').css({'min-height':($("body").height()+'px')});
    $('.car-report-button').click(function(){
        var targetButton = $(this).find('.actions input[type="submit"]');
        var emptyInputs = $(this).find('.col-car-data input[required="required"]').filter(function() {
            return this.value === "";
        });
        if(emptyInputs.length === 0){
            targetButton.removeAttr("disabled");
        }
        else{
            targetButton.attr("disabled", "disabled")
        }
    });
    $('.col-car-kit input[type="number"]').focus(function(){
        if ($(this).val() === "0") {
            $(this).val("");
        }
    });
    $('.col-car-kit input[type="number"]').focusout(function(){
       if ($(this).val() === ""){
          $(this).val("0");
       }
    });
    $('.col-car-kit .field-input .btn-plus').click(function(){
        var targetElement = $(this).parent('.field-input').children('input[type="number"]');
        var val =  parseInt(targetElement.val());
        val = val + 1;
        targetElement.val(val.toString());
    });
    $('.col-car-kit .field-input .btn-minus').click(function(){
        var targetElement = $(this).parent('.field-input').children('input[type="number"]');
        var val =  parseInt(targetElement.val());
        if (val >= 1) {
            val = val - 1;
        }
        else{
            val = 0;
        }
        targetElement.val(val.toString());
    });
    $('.widgets-header .date').datepicker({
        dateFormat: "dd/mm/yy",
        defaultDate: 0
    });
    $('.officers-header .add-officer').click(function(){
       $('.officer-form-wrapper').show();
    });
    $('.officer-form .header .fa-remove').click(function(){
       $('.officer-form-wrapper').hide();
    });
});
