$("#div_period").empty().append('
       <%= select_tag "period_id", options_for_select(@periods.collect{ |u| [u.fecha_desde, u.id]}), class: " form-control selectpicker", 'data-live-search'=>"true", "title"=>"Seleccione un Periodo" %>')
$("#period_id").empty().append("<%= escape_javascript(render(:partial => @periods)) %>")

$('.selectpicker').selectpicker('refresh')