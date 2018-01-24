$("#usuarios_poll").remove()
$('#users_poll').append('<div id="usuarios_poll"></div>')
$("#usuarios_poll").append("<%= escape_javascript(render(:partial => 'users/user2', locals: {users: @users})) %>")