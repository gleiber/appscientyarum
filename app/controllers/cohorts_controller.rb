class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  # GET /cohorts
  # GET /cohorts.json
  def index
    @programs = Program.all
    program = Program.first
    @cohorts = Cohort.all
  end
   def asignacion_recursos
    @programs = Program.all
    program = Program.first
    @cohorts = program.cohorts
  end

  def update_cohort
    @program = Program.find(params[:program_id])
    @cohorts = @program.cohorts
    respond_to do |format|
      format.js
    end
  end
  def update_cohort_planification
    @cohort_program = CohortProgram.find_by(program_id: params[:program_id], cohort_id: params[:cohort_id])
    @cohort_periods = @cohort_program.cohort_periods
    respond_to do |format|
      format.js
    end
  end

  def update_cohort_aula
    @program = Program.find(params[:program_id])
    @cohorts = @program.cohorts
    respond_to do |format|
      format.js
    end
  end
  def update_cohort_planification_aula
    @cohort_program = CohortProgram.find_by(program_id: params[:program_id], cohort_id: params[:cohort_id])
    @cohort_periods = @cohort_program.cohort_periods
    respond_to do |format|
      format.js
    end
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
  end


   

  # GET /cohorts/1/edit
  def edit
    @programs = Program.all
  end
  def cargar
    username = params[:username]
    @password = params[:password].to_s
    @user = User.find_by(username: username)

    respond_to do |format|
      if @user 
        format.json { render json: @user }
        #puts params[:password]
        #if @user.valid_password?(@password)
        #  format.json { render json: @user }
        #else
        #  format.json { render json: { errors: "Invalid email or password" } }
        #end
      else
        format.json { render json: { errors: "Invalid email or password" } }
      end
    end
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)
    respond_to do |format|
      if @cohort.save
        format.html { redirect_to '/maestricos/prueba?titulo=Cohorte&tabla=Cohort' }
        format.json { render action: 'show', status: :created, location: @cohort }
      else
        format.html { render action: 'new' }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Cohorte&tabla=Cohort'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_params
      params.require(:cohort).permit(:descripcion, :cohort_id, :program_id, :offer_id)
    end
end
