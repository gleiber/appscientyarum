class CohPerSubUsController < ApplicationController
  before_action :set_coh_per_sub_u, only: [:show, :edit, :update, :destroy]

  # GET /coh_per_sub_us
  # GET /coh_per_sub_us.json
  def index
    @coh_per_sub_us = CohPerSubU.all
    respond_to do |format|  
      format.html # index.html.erb  
      format.json { render :json => @coh_per_sub_us.to_json }
    end
  end
  def nota_materia
    @coh_per_sub_u = CohPerSubU.find(params[:coh_per_sub_u_nota])
    @sub_per_users = @coh_per_sub_u.sub_per_users

    subject_user_id = @coh_per_sub_u.subject_user_id
    subject_user = SubjectUser.find(subject_user_id)
    subject_id = subject_user.subject_id
    subject = Subject.find(subject_id)

    @sub_per_users.each do |spu|
      id = spu.user.id.to_s
      spu.update(nota: params[id])
      #Notificacion por Intranet
      notific = Notification.create(tittle: "Se encuentran disponibles las notas de la materia '"+subject.descripcion+"'",
                                      event: subject.descripcion.to_s,
                                      viewed: FALSE,
                                      id_user: id,
                                      url: $domain_url+"/notifications")
      publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                            notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)
      #Notificacion por Correo
      #SubjectResultMailer.sample_email(spu).deliver_now

    end
    redirect_to '/resultado', notice: 'Notas asignadas correctamente'
  end
  def resultado
    @programs = Program.all
    @cohorts = Cohort.all
    @cohort_periods = CohortPeriod.all
    @coh_per_sub_us = CohPerSubU.all
    @coh_per_sub_u = CohPerSubU.new
  end
  def update_cohorte_nota
    program = Program.find(params[:program_id])
    @cohorts = program.cohorts
    respond_to do |format|
      format.js
    end
  end
  def update_cohorte_periodo_nota
    cohort_program = CohortProgram.find_by(cohort_id: params[:cohort_id], program_id: params[:program_id])
    @cohort_periods = cohort_program.cohort_periods
    respond_to do |format|
      format.js
    end
  end
  def update_cohorte_periodo_materia_nota
    @coh_per_sub_us = CohPerSubU.where(cohort_period_id: params[:cohort_period_id])
    respond_to do |format|
      format.js
    end
  end
  def update_participante_nota
    @coh_per_sub_u = CohPerSubU.find(params[:coh_per_sub_u_id])
    @sub_per_users = @coh_per_sub_u.sub_per_users
    respond_to do |format|
      format.js
    end
  end


  # GET /coh_per_sub_us/1
  # GET /coh_per_sub_us/1.json
  def show
  end

  # GET /coh_per_sub_us/new
  def new
    @coh_per_sub_u = CohPerSubU.new
  end

  # GET /coh_per_sub_us/1/edit
  def edit
  end

  # POST /coh_per_sub_us
  # POST /coh_per_sub_us.json
  def create
    @coh_per_sub_u = CohPerSubU.new(coh_per_sub_u_params)
    @fecha1 = params[:fecha_start]
    @hora1 = params[:hora_start]
    @fecha2 = params[:fecha_end]
    @hora2 = params[:hora_end]
    @coh_per_sub_u.start = @fecha1 + " " + @hora1
    @coh_per_sub_u.end = @fecha2 + " " + @hora2
    respond_to do |format|
      if @coh_per_sub_u.save
        format.html { redirect_to @coh_per_sub_u}
        format.json { render action: 'show', status: :created, location: @coh_per_sub_u }
      else
        format.html { render action: 'new' }
        format.json { render json: @coh_per_sub_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coh_per_sub_us/1
  # PATCH/PUT /coh_per_sub_us/1.json
  def update
    respond_to do |format|
      if @coh_per_sub_u.update(coh_per_sub_u_params)
        format.html { redirect_to @coh_per_sub_u}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coh_per_sub_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coh_per_sub_us/1
  # DELETE /coh_per_sub_us/1.json
  def destroy
    @coh_per_sub_u.destroy
    respond_to do |format|
      format.html { redirect_to coh_per_sub_us_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coh_per_sub_u
      @coh_per_sub_u = CohPerSubU.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coh_per_sub_u_params
     # params.require(:coh_per_sub_u).permit(:subject_user_id, :cohort_period_id, :schedule_cohort_period_id, :program_id, :cohort_id, :subject_id, :cohorte_periodo_nota)
    end
end
