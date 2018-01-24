$("#idUsers").remove()
$("#divUsers").append('<div id="idUsers"></div>')
$("#idUsers").append("<%= escape_javascript(render(:partial => @participantes)) %>")