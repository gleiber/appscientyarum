class EvaCommThesesController < ApplicationController
  before_action :set_eva_comm_thesis, only: [:show, :edit, :update, :destroy]

  # GET /eva_comm_theses
  # GET /eva_comm_theses.json
  def index
    @theses = Thesis.all
    @eva_comm_theses = EvaCommThesis.all
  end

  # GET /eva_comm_theses/1
  # GET /eva_comm_theses/1.json
  def show
    @thesis = @eva_comm_thesis.thesis
 
  end

  # GET /eva_comm_theses/new
  def new
    @eva_comm_thesis = EvaCommThesis.new
    @thesis = Thesis.find params[:thesis_id]
    @theses = Thesis.all
    @users = User.all
    role = Role.where(descripcion: "Profesor").first  
    @users3 = role.users
  end

  # GET /eva_comm_theses/1/edit
  def edit
  end

  # POST /eva_comm_theses
  # POST /eva_comm_theses.json
  def create
    role = Role.where(descripcion: "Profesor").first  
    @users3 = role.users
    @eva_comm_thesis = EvaCommThesis.new(eva_comm_thesis_params)
    thesis = Thesis.find(@eva_comm_thesis.thesis_id)
     
    respond_to do |format|
      if params[:collections].present?

     @eva_comm_thesi = params[:collections]
      @eva_comm_thesi.each do |a|
        if a == "principal1"
          @eva_comm_thesis.principal_1 = thesis.project.eva_comm_proj.principal_1
        end

        if a == "principal2"
      @eva_comm_thesis.principal_2 = thesis.project.eva_comm_proj.principal_2

          
        end
         if a == "principal3"
      @eva_comm_thesis.principal_3 = thesis.project.eva_comm_proj.principal_3

          
        end
         if a == "suplente1"
      @eva_comm_thesis.suplente_1 = thesis.project.eva_comm_proj.suplente_1

        end
        if a == "suplente2"
      @eva_comm_thesis.suplente_2 = params[:suplente_2]

        end
        if a == "suplente3"
      @eva_comm_thesis.suplente_3 = params[:suplente_3]

        end

      end

      if @eva_comm_thesis.save
      Tracing.create(thesis_id: @eva_comm_thesis.thesis.id, descripcion: "Jurado Evaluador Asignada")

        #Notificar a los usuarios via correo y aplicativo
        TheseEvaCommMailer.sample_email(@eva_comm_thesis).deliver_now
        #Notificacion por intranet
        @descrip = "Se le informa que se ha asignado el Jurado Evaluador a su T.E.G: "+@eva_comm_thesis.thesis.titulo.to_s

        notific = Notification.create(tittle: "Se le informa que se ha asignado el jurado evaluador a su T.E.G: "+@eva_comm_proj.project.titulo.to_s,
                                      event: @descrip.to_s,
                                      viewed: FALSE,
                                      id_user: @eva_comm_thesis.thesis.user.id,
                                      id_publisher: current_user.id,
                                      url: "localhost:3000/notifications")

        publicar_notificacion(notific.tittle,"Hace un momento",current_user.nombre.to_s+"("+current_user.username.to_s+")", notific.id_user,
                              notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)

      @thesis = @eva_comm_thesis.thesis
=begin
        Principales y suplentes:
      if !EvaCommThesis.principal_1.nil?
        if !EvaCommThesis.principal_1 == ""
          notificar_comision(User.find(EvaCommThesis.principal_1.to_i),@thesis,"Principal 1") #Principal 1
        end
      end
      if !EvaCommThesis.principal_2.nil?
        if !EvaCommThesis.principal_2 == ""
          notificar_comision(User.find(EvaCommThesis.principal_2.to_i),@thesis,"Principal 2") #Principal 2
        end
      end
      if !EvaCommThesis.principal_3.nil?
        if !EvaCommThesis.principal_3 == ""
          notificar_comision(User.find(EvaCommThesis.principal_3.to_i),@thesis,"Principal 3") #Principal 3
        end
      end
      if !EvaCommThesis.suplente_1.nil?
        if !EvaCommThesis.suplente_1 == ""
          notificar_comision(User.find(EvaCommThesis.suplente_1.to_i),@thesis,"Suplente 1") #Suplente 1
        end
      end
      if !EvaCommThesis.suplente_2.nil?
        if !EvaCommThesis.suplente_2 == ""
          notificar_comision(User.find(EvaCommThesis.suplente_1.to_i),@thesis,"Suplente 2") #Suplente 2
        end
      end
      if !EvaCommThesis.suplente_3.nil?
        if !EvaCommThesis.suplente_3 == ""
          notificar_comision(User.find(EvaCommThesis.suplente_1.to_i),@thesis,"Suplente 3") #Suplente 3
        end
      end
=end







        format.html { redirect_to eva_comm_theses_path}
        format.json { render action: 'show', status: :created, location: @eva_comm_thesis }
      else
        format.html { render action: 'new' }
        format.json { render json: @eva_comm_thesis.errors, status: :unprocessable_entity }
      end
   else
       @thesis = @eva_comm_thesis.thesis
          role = Role.where(descripcion: "Participante").first
          @users = role.users

          role = Role.where(descripcion: "Profesor").first
          @users1 = role.users



          format.html { redirect_to '/eva_comm_theses/new?'+{thesis_id: @thesis.id}.to_param, alert: 'Debe Seleccionar el Jurado Evaluador'}
          format.json { render json: @eva_comm_thesis..errors, status: :unprocessable_entity }
    end
  end
  end

  # PATCH/PUT /eva_comm_theses/1
  # PATCH/PUT /eva_comm_theses/1.json
  def update
    respond_to do |format|
      if @eva_comm_thesis.update(eva_comm_thesis_params)
        format.html { redirect_to @eva_comm_thesis }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @eva_comm_thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eva_comm_theses/1
  # DELETE /eva_comm_theses/1.json
  def destroy
    @eva_comm_thesis.destroy
    respond_to do |format|
      format.html { redirect_to eva_comm_theses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eva_comm_thesis
      @eva_comm_thesis = EvaCommThesis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eva_comm_thesis_params
      params.require(:eva_comm_thesis).permit(:id, :principal_1, :principal_2, :principal_3, :suplente_1, 
        :suplente_2, :suplente_3, :thesis_id, :collections, :coordinador)
    end

  def notificar_comision(user,thesis,descripcion)
    @user = user
    @thesis = thesis
    @descripcion = descripcion
    notific = Notification.create(tittle: "Asignación a comisión evaluadora",
                                  event: "Se ha asignado a la comisión evaluadora del proyecto "+@thesis.titulo.upcase+" como "+@descripcion.upcase,
                                  viewed: FALSE,
                                  id_user: @user.id,
                                  id_publisher: nil,
                                  url: $domain_url+"/notifications")

    publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                          notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)

    #Notificacion por correo
    ThesisCommAsignationMailer.sample_email(@user,@thesis,@descripcion).deliver_now

  end


end
