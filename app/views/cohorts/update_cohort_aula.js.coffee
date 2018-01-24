$("#cohorte_select_aula").empty()
$("#cohorte_select_aula").html("<option value=''>Seleccione una Cohorte</option>")
$("#cohorte_select_aula").append("<%= escape_javascript(render(:partial => @cohorts)) %>")
$('.selectpicker').selectpicker('refresh')