$("#cohorte_periodo_nota").empty()
$("#cohorte_periodo_nota").html("<option value=''>Seleccione un Periodo</option>")
$("#cohorte_periodo_nota").append("<%= escape_javascript(render(:partial => 'cohort_periods/cohort_period2', locals: {cohort_periods: @cohort_periods})) %>")
$('.selectpicker').selectpicker('refresh')
