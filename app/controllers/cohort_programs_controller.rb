class CohortProgramsController < ApplicationController
  before_action :set_cohort_program, only: [:show, :edit, :update, :destroy]

  # GET /cohort_programs
  # GET /cohort_programs.json
  def index
    @cohort_programs = CohortProgram.all
  end

  # GET /cohort_programs/1
  # GET /cohort_programs/1.json
  def show
  end

  # GET /cohort_programs/new
  def new
    if (params[:offer_id]!="")
      @postulates = Postulate.all
      @offer = Offer.find(params[:offer_id])
      @program = @offer.program
      @postulates = @offer.postulates.where(decision: "aprobado")
      @regimen_durations = @program.regimen_durations
      @periods = Period.all
      @cohorts = Cohort.all
      rol = Role.where(descripcion: "Profesor").first
      @users = rol.users
      @programs = Program.all
      @cohort_program = CohortProgram.new
    else
      redirect_to '/recursos_oferta', alert:"Seleccione una oferta"
    end
  end

  # GET /cohort_programs/1/edit
  def edit
  end

  # POST /cohort_programs
  # POST /cohort_programs.json
  def create
    @cohort_program = CohortProgram.new(cohort_id: params[:cohort_id], program_id: params[:cohort_program][:program_id])
    offer = Offer.find(params[:offer_id])
    respond_to do |format|
    if params[:fecha_inscripcion].present?
      offer.update(fecha_inscripcion: params[:fecha_inscripcion])
      @program = offer.program
      @regimen_durations = @program.regimen_durations
        if @cohort_program.save
          offer.postulates.each do |p|
            if (p.decision == 'aprobado')
              u = User.create(role_id: '6',email: p.email, password: p.cedula, username: p.cedula,nombre: p.nombre, cedula: p.cedula,direccion: p.direccion,sex_id: p.sex_id,telefono: p.telefono,fecha_nacimiento: p.fecha_nacimiento,civil_status_id: p.civil_status_id, cohort_program_id: @cohort_program.id)
              CohortUser.create(cohort_program_id: @cohort_program.id, user_id: u.id)
              if p.collections.present?
                p.collections.each do |c|
                  UserCollection.create(user_id: u.id, collection_id: c.id)
                end
              end
              #pendiente que cambie esta relacion
              #Notificacion via Email al postulado
              ProgramCohortMailer.sample_email(u,@program,p).deliver_now
            end
          end
          @regimen_durations.each do |regimen_duration|
            p = regimen_duration.id.to_s
            coh_per = CohortPeriod.create(cohort_program_id: @cohort_program.id, period_id: params[p], regimen_duration_id: regimen_duration.id.to_s)
            regimen_duration.subject_regimen_durations.each do |subject_regimen_duration|
              id = regimen_duration.id.to_s + "_" + subject_regimen_duration.id.to_s
              sub_u = SubjectUser.create(subject_id: subject_regimen_duration.subject.id, user_id: params[id])

              # notific = Notification.create(tittle: "Fue asignado a la oferta del programa: '"+@program.titulo+"' como profesor de '"+subject_regimen_duration.subject.descripcion+"'",
              #                         event: @descrip.to_s,
              #                         viewed: FALSE,
              #                         id_user: sub_u.user_id,
              #                         url: "localhost:3000/notifications")
              @coh_per_sub_u = CohPerSubU.create(cohort_period_id: coh_per.id, subject_user_id: sub_u.id)
              #Se notifica a los profesores asignados por cada uno.
           
                notific = Notification.create(tittle: "Fue asignado a la oferta del programa: '"+@program.titulo+"' como profesor de '"+subject_regimen_duration.subject.descripcion+"'",
                                              event: @descrip.to_s,
                                              viewed: FALSE,
                                              id_user: sub_u.user_id,
                                              url: +$domain_url+"/notifications")
                publicar_notificacion(notific.tittle,"Hace un momento","Postgrado", notific.id_user,
                                      notific.event,Notification.where(:viewed => FALSE).where(:id_user => notific.id_user).count)
              
                if params[id].present?
                  #Via Correo Electrónico
                  AssignedProfessorMailer.sample_email(@coh_per_sub_u).deliver_now
                end
              end
          end
          format.html { redirect_to '/recursos_oferta', notice:"Recursos asignados Exitosamente" }
          format.json { render :show, status: :created, location: @cohort_program }
        else
          @postulates = Postulate.all
          @offer = Offer.find(params[:offer_id])
          @program = @offer.program
          @postulates = @offer.postulates.where(decision: "aprobado")
          @regimen_durations = @program.regimen_durations
          @periods = Period.all
          @cohorts = Cohort.all
          rol = Role.where(descripcion: "Profesor").first
          @users = rol.users
          @programs = Program.all
          format.html { render :new }
          format.json { render json: @cohort_program.errors, status: :unprocessable_entity }
        end
      
    else
      @postulates = Postulate.all
      @offer = Offer.find(params[:offer_id])
      @program = @offer.program
      @postulates = @offer.postulates.where(decision: "aprobado")
      @regimen_durations = @program.regimen_durations
      @periods = Period.all
      @cohorts = Cohort.all
      rol = Role.where(descripcion: "Profesor").first
      @users = rol.users
      @programs = Program.all
      format.html { render :new, alert: "Error falta la fecha" }
      format.json { render json: @cohort_program.errors, status: :unprocessable_entity }
    end
    end
  end

  # PATCH/PUT /cohort_programs/1
  # PATCH/PUT /cohort_programs/1.json
  def update
    respond_to do |format|
      if @cohort_program.update(cohort_program_params)
        format.html { redirect_to @cohort_program}
        format.json { render :show, status: :ok, location: @cohort_program }
      else
        format.html { render :edit }
        format.json { render json: @cohort_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohort_programs/1
  # DELETE /cohort_programs/1.json
  def destroy
    @cohort_program.destroy
    respond_to do |format|
      format.html { redirect_to cohort_programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort_program
      @cohort_program = CohortProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def cohort_program_params
    #  params.require(:cohort_program).permit(:cohort_id, :program_id)
    #end
end
