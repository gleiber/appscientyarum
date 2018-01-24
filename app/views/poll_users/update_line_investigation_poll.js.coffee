$("#area_interest_id_poll").empty()
#$("#area_interest_id_poll").html("<option value=''>Seleccione un Periodo</option>")
$("#area_interest_id_poll").append("<%= escape_javascript(render(:partial => 'area_interests/area_interest2', locals: {area_interests: @area_interests})) %>")
$('.selectpicker').selectpicker('refresh')