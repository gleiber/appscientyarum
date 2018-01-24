$("#areas").empty()
$("#areas").append("<%= escape_javascript(render(:partial => @area_interests)) %>")