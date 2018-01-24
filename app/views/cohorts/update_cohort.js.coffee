$("#cohorte_select").empty()
$("#cohorte_select").html("<option value=''>Seleccione una Cohorte</option>")
$("#cohorte_select").append("<%= escape_javascript(render(:partial => @cohorts)) %>")
$('.selectpicker').selectpicker('refresh')