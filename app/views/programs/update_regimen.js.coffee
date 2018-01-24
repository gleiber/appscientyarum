$("#regimen").remove()
$('#regimen-contenedor').append('<div id="regimen"></div>')
$("#regimen").append("<%= escape_javascript(render(:partial => @regimen_durations)) %>")

$('.selectpicker').selectpicker('refresh')