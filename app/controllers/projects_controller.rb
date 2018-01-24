class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json

  def index
    
  end

  def update_cohort_program
    user = User.find(params[:user_id])
    @cohort_program = user.cohort_program
    respond_to do |format|
      format.js
    end
  end

  def seguimiento
    @projects = Project.all 

  end
  def mi_proyecto
    @projects = Project.all 
    @line_investigations = LineInvestigation.all

  end

  def user_project

    user_id = params[:id]
    @project = Project.find_by(user_id: user_id)

    respond_to do |format|
      if @project 
        format.json { render json: @project, :status => :ok}
      else
        format.json { render json: @project, :status => :unprocessable_entity }
      end
    end
  end
  

  def update_project_tracing
    
    @tracings = Tracing.where(project_id: params[:project_id])
    respond_to do |format|
      format.js 
    end
  end


  def update_area_project
    line_investigations = LineInvestigation.find(params[:line_investigation_id])
    @area_interests = line_investigations.area_interests
    respond_to do |format|
      format.js 
    end
    
  end
  
  # GET /projects/1
  # GET /projects/1.json
  def show
    #asi me traigo la areas de investigacion que pertenecen a un proyecto 
    #segun la linea de investigacion que pertenece 
    @line_investigation = @project.line_investigation
    @area_interests = @project.area_interests

    role = Role.where(descripcion: "Participante").first  
    @users = role.users

     role = Role.where(descripcion: "Profesor").first  
    @users1 = role.users
  end

  # GET /projects/new
  def new
    @project = Project.new
    @programs = Program.all
    @cohorts = Cohort.all

    @line_investigations = LineInvestigation.all
    @area_interest = AreaInterest.all
    @users = User.all
    
    role = Role.where(descripcion: "Participante").first  
    @users = Array.new
    role.users.each do |u|
      unless u.project.present?
        @users.push u 
      end
      
    end 

     role = Role.where(descripcion: "Profesor").first  
    @users1 = role.users



 end



  # GET /projects/1/edit
  def edit
    role = Role.where(descripcion: "Participante").first  
    @users = role.users

     role = Role.where(descripcion: "Profesor").first  
    @users1 = role.users

    @programs = Program.all
    @cohorts = Cohort.all
    @line_investigations = LineInvestigation.all
    @area_interest = AreaInterest.all
    
    
  end

  # POST /projects
  # POST /projects.json
  def create
    
    @project = Project.new(project_params)
    @project.tutor = params[:tutor_id]
    @project.user_id = params[:user_id]
    @project.line_investigation_id = params[:select_line]
    @area_interests = params[:area_interests]
    respond_to do |format|

      if @project.save
        @area_interests.each do |id|
          ProjectAreaInterest.create(project_id: @project.id, area_interest_id: id)
        end

         Tracing.create(project_id: @project.id, descripcion: "Proyecto Registrado")

        #Notificaciones
        notific = Notification.create(tittle: "Se ha registrado su proyecto: "+@project.titulo.upcase,
                                      event: "Se ha registrado su proyecto: "+@project.titulo.upcase,
                                      viewed: FALSE,
                                      id_user: @project.user_id,
                                      id_publisher: nil,
                                      url: "localhost:3000/notifications")

        publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                              notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)
        #Notificacion via correo
        ProjectRegistrationMailer.sample_email(@project).deliver_now



        format.html { redirect_to @project , notice: 'Proyecto Creado Exitosamente'}
        format.json { render action: 'show', status: :created, location: @project }
      else
         @programs = Program.all
    @cohorts = Cohort.all
    @line_investigations = LineInvestigation.all
    @area_interest = AreaInterest.all
    @users = User.all
    

    role = Role.where(descripcion: "Participante").first  
    @users = role.users

     role = Role.where(descripcion: "Profesor").first  
    @users1 = role.users
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
      Tracing.create(project_id: @project.id, descripcion: "Proyecto Modificado")
        areainterests = ProjectAreaInterest.find_by_sql "Select * From project_area_interests where project_id="+@project.id.to_s+""
        areainterests.each do |p|
          p.destroy
       end
       params[:area_interests].each do |area_interest_id|
          ProjectAreaInterest.create(area_interest_id: area_interest_id, project_id: @project.id )
        end
        format.html { redirect_to @project }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:user_id, :titulo,:line_investigations, :tutor_id, :select_line,   :area_interest_id, :program_id, :cohorts_id)
  end
end