// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery-ui/datepicker
//= require jquery-ui/datepicker-es
//= require chosen-jquery
//= require_tree .

$(document).ready(loadChosen);
$(document).on('page:load', loadChosen);
$(document).on('page:load', displayModal);

var array_day_out = ["2016-01-01","2016-02-01","2016-03-21","2016-05-01","2016-09-16","2016-11-21","2016-12-25","2017-01-01"]

/*$('input').datepicker({
    beforeShowDay: function(date){
        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
        return [ array_day_out.indexOf(string) == -1 ]
    }
});*/
$(function() {
  $("#calendar").datepicker({
    beforeShowDay: function(date){
    var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
    return [ array_day_out.indexOf(string) == -1 ]
    },
    onSelect: function(date) {
      $("#appointment_scheduled_date").val(date)
      $("#new_appointment").modal();
    },
    minDate: 0,
    dayNamesMin: $.datepicker.regional.es.dayNamesShort,
    hideIfNoPrevNext: true
  });
});


var displayModal = $(function() {
  if ($(".has-errors").length)
    $("#new_appointment").modal();
});