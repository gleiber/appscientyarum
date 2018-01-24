class ProjectAreaInterestsController < ApplicationController
  before_action :set_project_area_interest, only: [:show, :edit, :update, :destroy]

  # GET /project_area_interests
  # GET /project_area_interests.json
  def index
    @project_area_interests = ProjectAreaInterest.all
  end

  # GET /project_area_interests/1
  # GET /project_area_interests/1.json
  def show
  end

  # GET /project_area_interests/new
  def new
    @project_area_interest = ProjectAreaInterest.new
  end

  # GET /project_area_interests/1/edit
  def edit
  end

  # POST /project_area_interests
  # POST /project_area_interests.json
  def create
    @project_area_interest = ProjectAreaInterest.new(project_area_interest_params)

    respond_to do |format|
      if @project_area_interest.save
        format.html { redirect_to @project_area_interest }
        format.json { render :show, status: :created, location: @project_area_interest }
      else
        format.html { render :new }
        format.json { render json: @project_area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_area_interests/1
  # PATCH/PUT /project_area_interests/1.json
  def update
    respond_to do |format|
      if @project_area_interest.update(project_area_interest_params)
        format.html { redirect_to @project_area_interest}
        format.json { render :show, status: :ok, location: @project_area_interest }
      else
        format.html { render :edit }
        format.json { render json: @project_area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_area_interests/1
  # DELETE /project_area_interests/1.json
  def destroy
    @project_area_interest.destroy
    respond_to do |format|
      format.html { redirect_to project_area_interests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_area_interest
      @project_area_interest = ProjectAreaInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_area_interest_params
      params.require(:project_area_interest).permit(:project_id, :area_interest_id)
    end
end
