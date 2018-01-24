class ReviewProjectsController < ApplicationController
  before_action :set_review_project, only: [ :edit, :update, :destroy]


  # GET /review_projects
  # GET /review_projects.json
  def index
    @review_projects = ReviewProject.all
    @type_reviews = TypeReview.all
  end

  # GET /review_projects/1
  # GET /review_projects/1.json
  def show
    @project = Project.find(params[:project_id])
    @review_projects = @project.review_projects
  end
  
  # GET /review_projects/new
  def new
    @project = Project.find(params[:project_id])
    @review_project = ReviewProject.new
    @type_reviews = TypeReview.all
  end

  # GET /review_projects/1/edit
  def edit
  end

  # POST /review_projects
  # POST /review_projects.json
  def create
    @review_project = ReviewProject.new(review_project_params)
    @review_project.type_review_id = params[:type_review_id]

    respond_to do |format|
      if @review_project.save
        Tracing.create(project_id: @review_project.project_id, descripcion: "Proyecto "+ @review_project.type_review.descripcion)
        ProjectReviewMailer.sample_email(@review_project).deliver_now
       @descrip = "Se te ha hecho una revisión al proyecto: "+Project.find(@review_project.project_id).titulo+", la cual obtuvo la revisión: "+TypeReview.find(params[:type_review_id].to_i).descripcion
       if params[:review_project][:descripcion].to_s.strip != ""
         @descrip = @descrip+", y con las siguientes observaciones: "+params[:review_project][:descripcion].to_s.strip
       end

        notific = Notification.create(tittle: "Su Proyecto: "+@review_project.project.titulo.upcase + " Fue revisado con resultado: "+@review_project.type_review.descripcion,
                                     event: @descrip.to_s,
                                     viewed: FALSE,
                                     id_user: @review_project.project.user.id,
                                      id_publisher: current_user.id,
                                     url: "localhost:3000/notifications")

       publicar_notificacion(notific.tittle,"Hace un momento",current_user.nombre.to_s+"("+current_user.username.to_s+")", notific.id_user,
                             notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)

       format.html { redirect_to review_projects_path , notice: 'Evaluación creada exitosamente'}
        format.json { render action: 'show', status: :created, location: @review_project }
      

        #Notificar a los usuarios via correo y aplicativo





       #Notificacion por intranet



      else
         @type_reviews = TypeReview.all
        @project = @review_project.project
        format.html { redirect_to '/review_projects/new?'+{project_id: @project.id}.to_param, alert: 'Debe Llenar todos los Campos'}
        format.json { render json: @review_project.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /review_projects/1
  # PATCH/PUT /review_projects/1.json
  def update
    respond_to do |format|
      if @review_project.update(eva_comm_proj_params)
        format.html { redirect_to edit_review_project_url(@review_project.project_id) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_projects/1
  # DELETE /review_projects/1.json
  def destroy
    @review_project.destroy
    respond_to do |format|
      format.html { redirect_to review_projects_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def set_review_project
      @proyect = Project.find(params[:id])
      @review_project = ReviewProject.find_or_create_by(:project_id => params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def review_project_params
      params.require(:review_project).permit(:principal_1, :codigo, :descripcion,:type_review, :principal_2, :principal_3, :suplente_1, :suplente_2, :suplente_3, :project_id)
    end


end