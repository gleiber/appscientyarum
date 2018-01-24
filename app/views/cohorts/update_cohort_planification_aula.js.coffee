$("#cohorte_periodo_aula").remove()
$('#cohorte-contenedor_aula').append('<div id="cohorte_periodo_aula"></div>')
$("#cohorte_periodo_aula").append("<%= escape_javascript(render(:partial => "cohort_periods/cohort_period_asignacion",locals: {cohort_periods: @cohort_periods})) %>")