$("#seguimiento_thesis").empty()
$("#seguimiento_thesis").append("<%= escape_javascript(render(:partial => @tracings)) %>")