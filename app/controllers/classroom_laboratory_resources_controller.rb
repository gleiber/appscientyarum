class ClassroomLaboratoryResourcesController < ApplicationController
  before_action :set_classroom_laboratory_resource, only: [:show, :edit, :update, :destroy]

  # GET /classroom_laboratory_resources
  # GET /classroom_laboratory_resources.json
  def index
    @classroom_laboratory_resources = ClassroomLaboratoryResource.all
  end

  # GET /classroom_laboratory_resources/1
  # GET /classroom_laboratory_resources/1.json
  def show
  end

  # GET /classroom_laboratory_resources/new
  def new
    @classroom_laboratory_resource = ClassroomLaboratoryResource.new
  end

  # GET /classroom_laboratory_resources/1/edit
  def edit
  end

  # POST /classroom_laboratory_resources
  # POST /classroom_laboratory_resources.json
  def create
    @classroom_laboratory_resource = ClassroomLaboratoryResource.new(classroom_laboratory_resource_params)

    respond_to do |format|
      if @classroom_laboratory_resource.save
        format.html { redirect_to @classroom_laboratory_resource }
        format.json { render action: 'show', status: :created, location: @classroom_laboratory_resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @classroom_laboratory_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classroom_laboratory_resources/1
  # PATCH/PUT /classroom_laboratory_resources/1.json
  def update
    respond_to do |format|
      if @classroom_laboratory_resource.update(classroom_laboratory_resource_params)
        format.html { redirect_to @classroom_laboratory_resource}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classroom_laboratory_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classroom_laboratory_resources/1
  # DELETE /classroom_laboratory_resources/1.json
  def destroy
    @classroom_laboratory_resource.destroy
    respond_to do |format|
      format.html { redirect_to classroom_laboratory_resources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_laboratory_resource
      @classroom_laboratory_resource = ClassroomLaboratoryResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_laboratory_resource_params
      params.require(:classroom_laboratory_resource).permit(:resource_id, :classroom_laboratory_id, :state_id)
    end
end
