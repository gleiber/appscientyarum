class RegimenStudiesController < ApplicationController
  before_action :set_regimen_study, only: [:show, :edit, :update, :destroy]

  # GET /regimen_studies
  # GET /regimen_studies.json
  def index
    @regimen_studies = RegimenStudy.all
  end

  # GET /regimen_studies/1
  # GET /regimen_studies/1.json
  def show
  end

  # GET /regimen_studies/new
  def new
    @regimen_study = RegimenStudy.new
  end

  # GET /regimen_studies/1/edit
  def edit
  end

  # POST /regimen_studies
  # POST /regimen_studies.json
  def create
    @regimen_study = RegimenStudy.new(regimen_study_params)

    respond_to do |format|
      if @regimen_study.save
        format.html { redirect_to '/maestricos/prueba?titulo=Regimen+de+Estudio&tabla=RegimenStudy' }
        format.json { render :show, status: :created, location: @regimen_study }
      else
        flash.now[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Regimen+de+Estudio&tabla=RegimenStudy'}
        format.json { render json: @regimen_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regimen_studies/1
  # PATCH/PUT /regimen_studies/1.json
  def update
    respond_to do |format|
      if @regimen_study.update(regimen_study_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Regimen+de+Estudio&tabla=RegimenStudy' }
        format.json { render :show, status: :ok, location: @regimen_study }
      else
        format.html { render :edit }
        format.json { render json: @regimen_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regimen_studies/1
  # DELETE /regimen_studies/1.json
  def destroy
    @regimen_study.destroy
    respond_to do |format|
      format.html { redirect_to regimen_studies_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regimen_study
      @regimen_study = RegimenStudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regimen_study_params
      params.require(:regimen_study).permit(:descripcion)
    end
end
