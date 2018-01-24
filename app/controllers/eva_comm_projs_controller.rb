class EvaCommProjsController < ApplicationController
  before_action :set_eva_comm_proj, only: [:show, :edit, :update, :destroy]

  # GET /eva_comm_projs
  # GET /eva_comm_projs.json
  def index
    if user_signed_in?
      @eva_comm_projs = EvaCommProj.all
    else
      redirect_to '/users/sign_in', notice: 'Debe Iniciar Sesión'
    end
  end

  # GET /eva_comm_projs/1
  # GET /eva_comm_projs/1.json
  def show
    @project = @eva_comm_proj.project
  end

  # GET /eva_comm_projs/new
  def new

    @project = Project.find(params[:format])

    @eva_comm_proj = EvaCommProj.new

    role = Role.where(descripcion: "Participante").first  
    @users = role.users

     role = Role.where(descripcion: "Profesor").first  
    @users1 = role.users 

  end

  # GET /eva_comm_projs/1/edit
  def edit
     @project = @eva_comm_proj.project
   
    role = Role.where(descripcion: "Participante").first  
    @users = role.users

     role = Role.where(descripcion: "Profesor").first  
    @users1 = role.users 


   

  end

  # POST /eva_comm_projs
  # POST /eva_comm_projs.json
  def create

      @eva_comm_proj = EvaCommProj.new(eva_comm_proj_params)

    respond_to do |format|
        if @eva_comm_proj.save
       
          Tracing.create(project_id: @eva_comm_proj.project.id, descripcion: "Comisión Evaluadora Asignada")



          #Notificar a los usuarios via correo y aplicativo
            ProjectEvaCommMailer.sample_email(@eva_comm_proj).deliver_now
          #Notificacion por intranet
            @descrip = "Se le informa que se ha asignado la comisión evaluadora a su proyecto: "+@eva_comm_proj.project.titulo.to_s

            notific = Notification.create(tittle: "Se ha asignado la Comisión Evaluadora para su Proyecto: "+@eva_comm_proj.project.titulo.upcase,
                                        event: @descrip.to_s,
                                        viewed: FALSE,
                                        id_user: @eva_comm_proj.project.user.id,
                                        id_publisher: current_user.id,
                                        url: "localhost:3000/notifications")

        publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                              notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)

      @project = @eva_comm_proj.project
      #Principales y suplentes:
            notificar_comision(User.find(@eva_comm_proj.principal_1.to_i),@project,"Principal 1") #Principal 1
          
            notificar_comision(User.find(@eva_comm_proj.principal_2.to_i),@project,"Principal 2") #Principal 2
          
            notificar_comision(User.find(@eva_comm_proj.principal_3.to_i),@project,"Principal 3") #Principal 3
         
            notificar_comision(User.find(@eva_comm_proj.suplente_1.to_i),@project,"Suplente 1") #Suplente 1
          
          format.html { redirect_to @eva_comm_proj, notice: 'Comisión Evaluadora Asignada Exitosamente' }
          format.json { render action: 'show', status: :created, location: @eva_comm_proj }
      #Fin de Notificacion =========================================================================================================0
      else
        @project = @eva_comm_proj.project
        role = Role.where(descripcion: "Participante").first
        @users = role.users

        role = Role.where(descripcion: "Profesor").first
        @users1 = role.users
        format.html { redirect_to '/eva_comm_projs/new.'+@project.id.to_s, alert: 'Debe Llenar todos los Campos'}
        format.json { render json: @eva_comm_proj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eva_comm_projs/1
  # PATCH/PUT /eva_comm_projs/1.json
  def update
   

  

      @eva_comm_proj = EvaCommProj.new(eva_comm_proj_params)

    respond_to do |format|
      if @eva_comm_proj.update(eva_comm_proj_params)
    Tracing.create(project_id: @eva_comm_proj.project.id, descripcion: "Comisión Evaluadora Modificada")

        format.html { redirect_to @eva_comm_proj , notice:'Comisión Evaluadora Modificada'}
        format.json { head :no_content }
      else

        format.html { render action: 'edit'  }
        format.json { render json: @eva_comm_proj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eva_comm_projs/1
  # DELETE /eva_comm_projs/1.json
  def destroy
    @eva_comm_proj.destroy
    respond_to do |format|
      format.html { redirect_to eva_comm_projs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eva_comm_proj
      @eva_comm_proj = EvaCommProj.find(params[:id])
      #@eva_comm_proj = EvaCommProj.find_or_create_by(:project_id => params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eva_comm_proj_params
      params.require(:eva_comm_proj).permit(:principal_1, :eva_comm_proj_coordinador, :principal_2, :principal_3, :suplente_1,  :coordinador, :project_id, :eva_comm_proj_principal_1)
    end

  def notificar_comision(user,project,descripcion)
    @user = user
    @project = project
    @descripcion = descripcion
    notific = Notification.create(tittle: "Se ha asignado a la comisión evaluadora del proyecto "+@project.titulo.upcase+" como "+@descripcion.upcase,
                                  event: "Se ha asignado a la comisión evaluadora del proyecto "+@project.titulo.upcase+" como "+@descripcion.upcase,
                                  viewed: FALSE,
                                  id_user: @user.id,
                                  id_publisher: nil,
                                  url: $domain_url+"/notifications")

    publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                          notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)

    #Notificacion por correo
    CommAsignationMailer.sample_email(@user,@project,@descripcion).deliver_now

  end



end
