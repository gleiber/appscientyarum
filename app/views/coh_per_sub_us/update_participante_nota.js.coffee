$("#participantes_notas").remove()
$('#divparticipantes').append('<div id="participantes_notas"></div>')
$("#participantes_notas").append("<%= escape_javascript(render(:partial => @sub_per_users)) %>")

