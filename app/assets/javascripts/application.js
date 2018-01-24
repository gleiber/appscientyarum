// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
//= require jquery/jquery-3.1.1.min.js
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require inspinia.js
//= require moment 
//= require Chart.bundle
//= require chartkick
//= require fullcalendar/fullcalendar.min.js
//= javascript_include_tag 'application'//= require fullcalendar_engine/application
//= require jquery.transit.min
//= require daterangepicker
//= require scheduler
//= require jquery-ui-timepicker-addon
//= require fullcalendar/gcal
//= require_tree ./channels
//= require_tree ./charts
//= require_tree .


function updateNotific(){
    $.ajax("/notifications/actualizar_contador")
}


               


