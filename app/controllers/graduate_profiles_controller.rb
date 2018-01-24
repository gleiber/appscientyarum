class GraduateProfilesController < ApplicationController
  before_action :set_graduate_profile, only: [:show, :edit, :update, :destroy]

  # GET /graduate_profiles
  # GET /graduate_profiles.json
  def index
    @graduate_profiles = GraduateProfile.all
  end

  # GET /graduate_profiles/1
  # GET /graduate_profiles/1.json
  def show
  end

  # GET /graduate_profiles/new
  def new  
   if params[:program_id_gp].present?
      @program = Program.find(params[:program_id_gp])
    @graduate_profile = GraduateProfile.new
    else
      redirect_to '/perfil_egresado_programa' , alert: 'Seleccione un programa' 
    end
  end
  

  # GET /graduate_profiles/1/edit
  def edit
 @program = @graduate_profile.program

  end

  # POST /graduate_profiles
  # POST /graduate_profiles.json
  def create
    @graduate_profile = GraduateProfile.new(graduate_profile_params)

    respond_to do |format|
      if @graduate_profile.save
        format.html { redirect_to "/perfil_egresado_programa", notice:"Perfil creado exitosamente." }
        format.json { render :show, status: :created, location: @graduate_profile }
      else
        @program = @graduate_profile.program
        format.html { render :new }
        format.json { render json: @graduate_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graduate_profiles/1
  # PATCH/PUT /graduate_profiles/1.json
  def update
    respond_to do |format|
      if @graduate_profile.update(graduate_profile_params)
        format.html { redirect_to  "/perfil_egresado_programa", notice:"Modificacion exitosa."}
        format.json { render :show, status: :ok, location: @graduate_profile }
      else
        format.html { render :edit }
        format.json { render json: @graduate_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduate_profiles/1
  # DELETE /graduate_profiles/1.json
  def destroy
    @graduate_profile.destroy
    respond_to do |format|
      format.html { redirect_to graduate_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graduate_profile
      @graduate_profile = GraduateProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graduate_profile_params
      params.require(:graduate_profile).permit(:descripcion, :program_id, :program_id_gp, :graduate_profile_id)
    end
end
