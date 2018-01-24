//= require cable
//= require_self
//= require_tree .

this.App = {};
App.cable = ActionCable.createConsumer("/cable");
App.notifications = App.cable.subscriptions.create('NotificationsChannel', {
    received: function(data) {
        var current_user_id = 0
        $.ajax({
            type: "GET",
            url: "/users/current_user_json",
            dataType: "json",
            success: function(datum){
                 current_user_id = datum[0].id
                if(current_user_id == data.id_user){
                    $("#notification-counter").text(data.counter)
                    $("#contador_notific").text(data.counter)
                    if(data.tittle !=null){
                        $("#notificationList").prepend(renderNotificacion(data))
                        $("#toggle_notification_list").prepend(renderToggleNotifications(data))
                    }
                }else{
                    $("#notification-counter").text(30)
                    $("#contador_notific").text(30)
                }
            }
        });
        function renderNotificacion(data) {
            return "<li class='notification_li'><div class = 'notification_row'><h3>"+data.nombre_publicador+" publicó:</h3><span><b>"+data.tittle+":</b> "+data.event+"</span></div><div class = 'notification_row_time'>Hace un momento!</div></li>"

        }
        function renderToggleNotifications(data){
            return "<li><a href='#'>" +
            "<div id=''><i class='fa fa-envelope fa-fw'></i>"
            +data.tittle+"<span class='pull-right text-muted small'>"
             +data.created_at+"</span></div></a></li><li class='divider'></li>"
        }
    }
});