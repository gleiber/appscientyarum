/**
 * Created by maracara on 19/02/17.
 */
App.eventos = App.cable.subscriptions.create('NotificationsChannel', {
    received: function(data) {
        // $counter = $("#notification-counter")
        // val = parseInt($counter2.text())
        // val = 20
        // $counter.text(val)
        $("#notification-counter").text(20)
        $("#contador_notific").text(20)
    }
});