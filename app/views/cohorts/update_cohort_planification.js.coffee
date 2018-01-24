$("#cohorte_periodo_aula").remove()
$('#cohorte-contenedor').append('<div id="cohorte_periodo_aula"></div>')
$("#cohorte_periodo_aula").append("<%= escape_javascript(render(:partial => @cohort_periods)) %>")