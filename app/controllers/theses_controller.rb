class ThesesController < ApplicationController
  before_action :set_thesis, only: [:show, :edit, :update, :destroy]

  # GET /theses
  # GET /theses.json
  def index
    @theses = Thesis.all
   
  end
  def seguimiento1
    @theses = Thesis.all
  end

   def update_thesis_tracing
    @tracings = Tracing.where(thesis_id: params[:thesis_id])
    respond_to do |format|
      format.js
    end

  end

   def mi_tesis
    @theses = Thesis.all
    @line_investigations = LineInvestigation.all

  end

def registrartheses
  
  @projectss = Project.all
  @project = Project.new
  
end
  # GET /theses/1
  # GET /theses/1.json
  def show
    @line_investigation = @thesis.line_investigation
    @area_interests = @thesis.project.area_interests

    role = Role.where(descripcion: "Participante").first
    @users = role.users

     role = Role.where(descripcion: "Profesor").first
    @users1 = role.users

  end

  # GET /theses/new
  
  def new

    @thesis = Thesis.new

    @project = Project.find(params[:projectid])

    @programs=Program.all
    @cohorts = Cohort.all
    @line_investigations = LineInvestigation.all
    @area_interest = AreaInterest.all
  end

  # GET /theses/1/edit
  def edit

    @line_investigations = LineInvestigation.all
    role = Role.where(descripcion: "Participante").first
    @users = role.users

     role = Role.where(descripcion: "Profesor").first
    @users1 = role.users

    @programs = Program.all
    @cohorts = Cohort.all

    @line_investigation = @thesis.line_investigation
    @area_interests = @thesis.project.area_interests

  end

  # POST /theses
  # POST /theses.json
  def create
    @thesis = Thesis.new(thesis_params)
    project = Project.find(@thesis.project_id)
    @thesis.titulo = project.titulo
    @thesis.line_investigation_id = project.line_investigation.id
    @thesis.tutor = project.tutor
   
    respond_to do |format|
      if @thesis.save
    Tracing.create(thesis_id: @thesis.id, descripcion: "Tesis/TEG Registrada")

    #Notificaciones
    notific = Notification.create(tittle: "Se ha registrado su T.E.G: "+@thesis.titulo.upcase,
                                  event: "Se ha registrado su T.E.G: "+@thesis.titulo.upcase,
                                  viewed: FALSE,
                                  id_user: @thesis.user_id,
                                  id_publisher: nil,
                                  url: $domain_url+"/notifications")

    publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                          notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)
    NewThesesMailer.sample_email(@thesis).deliver_now


        format.html { redirect_to theses_path }
        format.json { render action: 'show', status: :created, location: @thesis }

      else
        format.html { render action: 'new' }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end


  def user_thesis

    user_id = params[:id]
    @thesis = Thesis.find_by(user_id: user_id)

    respond_to do |format|
      if @thesis 
        format.json { render json: @thesis, :status => :ok}
      else
        format.json { render json: @thesis, :status => :unprocessable_entity }
      end
    end
    
  end


  # PATCH/PUT /theses/1
  # PATCH/PUT /theses/1.json
  def update
    respond_to do |format|

      if @thesis.update(thesis_params)
        format.html { redirect_to @thesis }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theses/1
  # DELETE /theses/1.json
  def destroy
    @thesis.destroy
    respond_to do |format|
      format.html { redirect_to theses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thesis
      @thesis = Thesis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thesis_params
      params.require(:thesis).permit(:projectid, :tutor, :descripcion, :user_id, :area_interest_id,:line_investigations, :line_investigation_id, :program_id, :cohorts_id, :titulo, :project_id, :thesis_id)
    end
end
