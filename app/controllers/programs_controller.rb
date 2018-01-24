class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
    @collections = Collection.all
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @program = Program.find(params[:id])
    @collections = @program.collections
  end
 
  def update_lines
    @program = Program.find(params[:program_id])
    @lines = @program.line_investigations
    respond_to do |format|
      format.js
    end
  end
  
  def update_profiles
    @program = Program.find(params[:program_id])
    @graduate_profiles = @program.graduate_profiles
    respond_to do |format|
      format.js
    end
  end



  def update_regimen
    if params[:program_id]
      id = params[:program_id]
    else
      id = params[:id]
    end
    @program = Program.find(id)
    @regimen_durations = @program.regimen_durations
    @subject_regimen_duration = SubjectRegimenDuration.new
    @subjects = Subject.all
    respond_to do |format|
      format.js
    end
  end

  # GET /programs/new
  def new
    @program = Program.new
    @regimen_study = RegimenStudy.all
    @modality = Modality.all
    @subjects = Subject.all
    role = Role.where(descripcion: "Coordinador de Programa").first
    @users = role.users
    @collections = Collection.all
  end

  
  # GET /programs/1/edit
  def edit
    @regimen_study = RegimenStudy.all
    @modality = Modality.all
    @subjects = Subject.all
    @users = User.all
    @collections = Collection.all
  end
  def lineas_programas
    @programs = Program.all
    @program = Program.new
  end

    def perfil_egresado_programas
    @programs = Program.all
    @program = Program.new
  end

  def pensum_programas
    @programs = Program.all
    @program = Program.new
    @subject_regimen_duration = SubjectRegimenDuration.new
    @subjects = Subject.all
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)
    @program.modality_id = params[:modality_id]
    @program.regimen_study_id = params[:regimen_study_id]
    @program.collections = params[:collections]
    @program.user_id = params[:user_id]


    respond_to do |format|
      if @program.save
        params[:collections].each do |collection_id|
          ProgramCollection.create(collection_id: collection_id, program_id: @program.id )
        end
        for i in 1..@program.duracion.to_i
          RegimenDuration.create(numero: i, program_id: @program.id)
        end
        format.html { redirect_to programs_path, notice: 'Programa creado exitosamente.' }
        format.json { render action: 'show', status: :created, location: @program }
      else
        @regimen_study = RegimenStudy.all
        @modality = Modality.all
        @subjects = Subject.all
        role = Role.where(descripcion: "Coordinador de Programa").first
        @users = role.users
        @collections = Collection.all
        format.html { render action: 'new' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        collections = ProgramCollection.find_by_sql "Select * From program_collections where program_id="+@program.id.to_s+""
        collections.each do |program_collection|
          program_collection.destroy
        end
        params[:collections].each do |collection_id|
          ProgramCollection.create(collection_id: collection_id, program_id: @program.id )
        end
        format.html { redirect_to programs_path, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:titulo, :descripcion, :duracion, :grado_egresado, :regimen_study_id, :modality_id, :postgraduate_coordination_id, :fecha_desde, :fecha_desde, :program, :subjects, :collects , :avatar )
    end
end