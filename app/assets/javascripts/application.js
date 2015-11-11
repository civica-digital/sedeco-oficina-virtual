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
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery-ui/datepicker
//= require jquery-ui/datepicker-es
//= require chosen-jquery
//= require_tree .

$(document).ready(loadChosen);
$(document).on('page:load', loadChosen);

$(function() {
  $("#calendar").datepicker({ minDate: 0, dayNamesMin: $.datepicker.regional.es.dayNamesShort });
});

