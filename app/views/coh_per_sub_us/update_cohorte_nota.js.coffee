$("#cohorte_nota").empty()
$("#cohorte_nota").html("<option value=''>Seleccione una Cohorte</option>")
$("#cohorte_nota").append("<%= escape_javascript(render(:partial => 'cohorts/cohort2', locals: {cohorts: @cohorts})) %>")
$('.selectpicker').selectpicker('refresh')