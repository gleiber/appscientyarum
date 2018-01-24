class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

#before_action :authenticate_user!

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :resource, :resource_name, :devise_mapping, :resource_class
  protect_from_forgery
  before_action :set_notification


    $domain_url = "http://localhost:3000"


  def resource_class
    devise_mapping.to
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :nombre, :cedula, :direccion, :sexo, :telefono, :fecha_nacimiento, :estado_civil, :role_id, :avatar, :id, :user_id])
    #devise_parameter_sanitizer.for(:sign_up) << :role << :email << :password << :password_confirmation

  end
  
  def set_notification
    @notifications = Notification.where(viewed: false).reverse
  end

  def publicar_notificacion(titulo,creado,publicador,id_usuario,evento,contador)

    ActionCable.server.broadcast 'notification_channel', tittle: titulo, created_at: creado,
                                 nombre_publicador: publicador,
                                 id_user: id_usuario,event: evento, counter: contador

  end
  private 

  def after_sign_out_path_for(resource_or_scope)
    '/logins'
  end

end


