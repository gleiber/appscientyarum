class RegimenDurationsController < ApplicationController
  before_action :set_regimen_duration, only: [:show, :edit, :update, :destroy]

  # GET /regimen_durations
  # GET /regimen_durations.json
  def index
    if params[:program_id]
      id = params[:program_id]
    else
      id = params[:id]
    end
    @program = Program.find(id)
    @regimen_durations = @program.regimen_durations
    @subject_regimen_duration = SubjectRegimenDuration.new
    @subjects = Subject.all
  end
  def update_subjects
    if params[:regimen_durations_id]
      id = params[:regimen_durations_id]
    else
      id = params[:id]
    end
    @regimen_duration = RegimenDuration.find(id)
    @subject_regimen_durations = @regimen_duration.subject_regimen_durations
    respond_to do |format|
      format.js
    end
  end

  # GET /regimen_durations/1
  # GET /regimen_durations/1.json
  def show
  end

  # GET /regimen_durations/new
  def new
    @regimen_duration = RegimenDuration.new
  end

  # GET /regimen_durations/1/edit
  def edit
  end

  # POST /regimen_durations
  # POST /regimen_durations.json
  def create
    @regimen_duration = RegimenDuration.new(regimen_duration_params)

    respond_to do |format|
      if @regimen_duration.save
        format.html { redirect_to @regimen_duration }
        format.json { render :show, status: :created, location: @regimen_duration }
      else
        format.html { render :new }
        format.json { render json: @regimen_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regimen_durations/1
  # PATCH/PUT /regimen_durations/1.json
  def update
    respond_to do |format|
      if @regimen_duration.update(regimen_duration_params)
        format.html { redirect_to @regimen_duration }
        format.json { render :show, status: :ok, location: @regimen_duration }
      else
        format.html { render :edit }
        format.json { render json: @regimen_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regimen_durations/1
  # DELETE /regimen_durations/1.json
  def destroy
    @regimen_duration.destroy
    respond_to do |format|
      format.html { redirect_to regimen_durations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regimen_duration
      @regimen_duration = RegimenDuration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regimen_duration_params
      params.require(:regimen_duration).permit(:program_id, :numero, :id)
    end
end
