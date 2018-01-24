class NotificationsController < ApplicationController
  def index
    actualizar_contador
    @notifications = Notification.order(created_at: :desc)
  end

  def actualizar_contador
    if current_user
      #TODO: Cambiar la comparacion del id de usuario por el current user
      Notification.where(:viewed => FALSE).where(:id_user =>current_user.id).update_all("viewed = TRUE")
      ActionCable.server.broadcast 'notification_channel',id_user: current_user.id,
                                   counter: Notification.where(:viewed => FALSE)
                                                .where(:id_user => current_user.id).count
    end

  end

  def unseen_notif_movil
    user_id = params[:id]
    @notifications = Notification.where(id_user: user_id).where(viewed: false)

    respond_to do |format|
      if @notifications 
        format.json { render json: @notifications, :status => :ok}
      else
        format.json { render json: @notifications, :status => :unprocessable_entity }
      end
    end
  end

  def all_notif_movil
    user_id = params[:id]
    @notifications = Notification.where(id_user: user_id)

    respond_to do |format|
      if @notifications 
        format.json { render json: @notifications, :status => :ok}
      else
        format.json { render json: @notifications, :status => :unprocessable_entity }
      end
    end
  end

  def view_notif_movil
    
    user_id = params[:id]
    @notifications = Notification.where(id_user: user_id).where(viewed: false)

    @notifications.each do |notif|
      notif.update(viewed: true)
    end

  end



end
