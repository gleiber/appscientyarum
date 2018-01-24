$("#seguimiento_project").empty()
$("#seguimiento_project").append("<%= escape_javascript(render(:partial => @tracings)) %>")