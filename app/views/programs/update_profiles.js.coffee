$("#graduate").empty()
$("#graduate").append("<%= escape_javascript(render(:partial => @graduate_profiles)) %>")