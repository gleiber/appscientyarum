class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(counter)
    ActionCable.server.broadcast 'notification_channel', counter: render_counter(counter)
  end



  private

  def render_notifications(notific)
    ApplicationController.renderer.render(partial: 'notifications/notification_center', locals: { notifications: notific })
  end

  def render_counter(counter)
    ApplicationController.renderer.render(partial: 'notifica/topnavbar', locals: { counter: counter })
  end

end