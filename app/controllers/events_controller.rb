class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
    @classroom_laboratories = ClassroomLaboratory.all
    @request_class_labs = RequestClassLab.all
    
  end

  def edit
  end


  def create
    @event = Event.new(event_params)
    @event.aula =  params[:event][:aula]   
    @events = Event.where(aula: @event.aula)


    if  params[:recurrencia].to_i ==1
      puts "Entro recurrencia"       
     
      (1..params[:duracion].to_i).each do |i| 

       if i==1
        @event.save      
      else
        @event.start = @event.start + 7.days
        @event.end = @event.end + 7.days
        @event = Event.create( title: @event.title, date_range: @event.date_range, start: @event.start, end: @event.end, color: @event.color, aula: @event.aula,  request_class_lab_id: @event.request_class_lab_id, solicitante: @event.solicitante)
        puts "Grabo recurrencia"                 
      end              
    end     
redirect_to '/appviews/calendar'
  else
    puts "No Entro recurrencia"
    @event.save
       #usuario = request.defending_thesis.thesis.user
      #Se envia el correo
    #RequestClassLabMailer.sample_email(request).deliver_now
    #Se notifica por intranet al usuario dueño de la tesis.
    #notific = Notification.create(tittle: "Defensa de tesis "+request.defending_thesis.thesis.titulo,
     #                             event: "se le informa que su tesis será defendido en la fecha: "+request.start.to_s+" en el salón "+request.aula.to_s,
      #                            viewed: FALSE,
       #                           id_user: usuario.id,id_publisher: current_user.id,
        #                          url: "http://192.168.0.120:3000/notifications")
    #publicar_notificacion(notific.tittle,"Hace un momento",current_user.nombre.to_s+"("+current_user.username.to_s+")", notific.id_user,
     #                     notific.event,Notification.where(:viewed => FALSE).where(:id_user => usuario.id).count)



    redirect_to '/appviews/calendar'
                #flash[:success] = "Welcome to the Sample App!"




  end

end

def update
  @event.update(event_params)
end

def destroy
  @event.destroy
end

private
def set_event
  @event = Event.find(params[:id])
end

def event_params
  params.require(:event).permit(:title, :date_range, :start, :end, :color, :aula, :recurrencia, :duracion, :request_class_lab_id, :solicitante)
end
end