$("#coh_per_sub_u_nota").empty()
$("#coh_per_sub_u_nota").html("<option value=''>Selecciona una Materia</option>")
$("#coh_per_sub_u_nota").append("<%= escape_javascript(render(:partial => @coh_per_sub_us)) %>")
$('.selectpicker').selectpicker('refresh')