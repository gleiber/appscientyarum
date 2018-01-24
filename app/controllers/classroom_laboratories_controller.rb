class ClassroomLaboratoriesController < ApplicationController
  before_action :set_classroom_laboratory, only: [:show, :edit, :update, :destroy]

  # GET /classroom_laboratories
  # GET /classroom_laboratories.json
  def index
    @classroom_laboratories = ClassroomLaboratory.all
  end

  # GET /classroom_laboratories/1
  # GET /classroom_laboratories/1.json
  def show
  end

  # GET /classroom_laboratories/new
  def new
    @classroom_laboratory = ClassroomLaboratory.new
  end

  # GET /classroom_laboratories/1/edit
  def edit
  end

  # POST /classroom_laboratories
  # POST /classroom_laboratories.json
  def create
    @classroom_laboratory = ClassroomLaboratory.new(classroom_laboratory_params)

    respond_to do |format|
      if @classroom_laboratory.save
        format.html { redirect_to '/maestricos/prueba?titulo=Aulas/Laboratorios&tabla=ClassroomLaboratory' }
        format.json { render action: 'show', status: :created, location: @classroom_laboratory }
      else
        format.html { render action: 'new' }
        format.json { render json: @classroom_laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classroom_laboratories/1
  # PATCH/PUT /classroom_laboratories/1.json
  def update
    respond_to do |format|
      if @classroom_laboratory.update(classroom_laboratory_params)
        format.html { redirect_to @classroom_laboratory}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classroom_laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classroom_laboratories/1
  # DELETE /classroom_laboratories/1.json
  def destroy
    @classroom_laboratory.destroy
    respond_to do |format|
      format.html { redirect_to '/maestricos/prueba?titulo=Aulas/Laboratorios&tabla=ClassroomLaboratory' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_laboratory
      @classroom_laboratory = ClassroomLaboratory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_laboratory_params
      params.require(:classroom_laboratory).permit(:descripcion)
    end
end
