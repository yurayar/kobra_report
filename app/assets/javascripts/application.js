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
    $('.report-form-wrapper').css({'min-height':($("body").height()+'px')})
});