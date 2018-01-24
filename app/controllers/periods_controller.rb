class PeriodsController < ApplicationController
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  # GET /periods
  # GET /periods.json
  def index
    @periods = Period.all
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
  end

  # GET /periods/new
  def new
    @period = Period.new
  end

  # GET /periods/1/edit
  def edit
    @period = Period.find(params[:id])
  end

  # POST /periods
  # POST /periods.json
  def create
    if params[:fecha_desde] != params[:fecha_hasta]
      @period = Period.new
      @period.fecha_desde = params[:fecha_desde]
      @period.fecha_hasta = params[:fecha_hasta]
      respond_to do |format|
        if @period.save
          format.html { redirect_to periods_path, notice:"Periodo creado exitosamente." }
          format.json { render action: 'show', status: :created, location: @period }
        else
          format.html { render action: 'new' }
          format.json { render json: @period.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_period_path, notice: "Las fechas no deden ser iguales."
    end
  end

  # PATCH/PUT /periods/1
  # PATCH/PUT /periods/1.json
  def update
    if params[:fecha_desde] != params[:fecha_hasta]
      @fecha_desde = params[:fecha_desde]
      @fecha_hasta = params[:fecha_hasta]
      respond_to do |format|
        if @period.update(fecha_desde: @fecha_desde, fecha_hasta: @fecha_hasta)
          format.html { redirect_to periods_path }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @period.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to edit_period_path, notice: "Las fechas no deden ser iguales."
    end
  end

def registrar_participantes_periodo
    @period = Period.new
    @programs = Program.all
    render 'periods/registrar_participantes_periodo'
  end

  def update_cohorts

    cohort_programs = CohortProgram.where(program_id: params[:program_id])

    @cohorts = Array.new
    cohort_programs.each do |cohort_program|
      @cohorts.push(Cohort.find(cohort_program.cohort_id))
    end

    respond_to do |format|
      format.js
    end

  end

  def update_periods

    cohort_program = CohortProgram.where(cohort_id: params[:cohort_id]).find_by(program_id: params[:program_id])

    cohort_periods = CohortPeriod.where(cohort_program_id: cohort_program.id)

    @periods = Array.new
    cohort_periods.each do |cohort_period|
      @periods.push(Period.find(cohort_period.period_id))
    end

    respond_to do |format|
      format.js
    end

  end


  def update_participantes

    cohort_program = CohortProgram.where(cohort_id: params[:cohort_id]).find_by(program_id: params[:program_id])
    cohort_users = CohortUser.where(cohort_program_id: cohort_program.id)
    
    @participantes = Array.new
    cohort_users.each do |cohort_user|
      @participantes.push(User.find(cohort_user.user_id))
    end

    respond_to do |format|
      format.js
    end

  end

  def save_period_users

    puts params.inspect
    if params[:users].present?
      users = params[:users]
      cohort_program = CohortProgram.where(cohort_id: params[:cohort_select]).find_by(program_id: params[:program_id])
      cohort_period = CohortPeriod.where(cohort_program_id: cohort_program.id).find_by(period_id: params[:period_id])

      users.each do |user|

        cohort_period_user = CohortPeriodUser.new
        cohort_period_user.cohort_period_id = cohort_period.id
        cohort_period_user.cohort_user_id = CohortUser.where(cohort_program_id: cohort_program.id).find_by(user_id: user).id
        
        coh_per_sub_us = CohPerSubU.where(cohort_period_id: cohort_period.id)
        if (coh_per_sub_us)
          coh_per_sub_us.each do |coh_per_sub_u|
            sub_per_us = SubPerUser.new
            sub_per_us.user_id = user
            sub_per_us.coh_per_sub_u_id = coh_per_sub_u.id
            sub_per_us.save
          end
        end

        cohort_period_user.save
      end
      redirect_to '/registrar_participantes', notice: 'Estudiantes añadidos exitosamente'
    else
      redirect_to '/registrar_participantes', alert: 'Deben seleccionar a los estudiantes'
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @period.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Periodo&tabla=Period' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_period
      @period = Period.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def period_params
      params.require(:period).permit(:fecha_desde, :fecha_hasta)
    end
end
