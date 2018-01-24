$("#area_interes_project").empty()
$("#area_interes_project").html("<%= j render(:partial => 'area_interests/area_linea', locals: {area_interests: @area_interests}) %>") 