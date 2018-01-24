$("#lineas").empty()
$("#lineas").append("<%= escape_javascript(render(:partial => @lines)) %>")