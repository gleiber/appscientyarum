class SubjectRegimenDurationsController < ApplicationController
  before_action :set_subject_regimen_duration, only: [:show, :edit, :update, :destroy]
  # GET /subject_regimen_durations
  # GET /subject_regimen_durations.json
  def index
    @subject_regimen_durations = SubjectRegimenDuration.all
  end

  # GET /subject_regimen_durations/1
  # GET /subject_regimen_durations/1.json
  def show
  end

  # GET /subject_regimen_durations/new
  def new
    @subject_regimen_duration = SubjectRegimenDuration.new
  end

  # GET /subject_regimen_durations/1/edit
  def edit
  end

  # POST /subject_regimen_durations
  # POST /subject_regimen_durations.json
  def create
    @subject_regimen_duration = SubjectRegimenDuration.new(subject_regimen_duration_params)
    @subject_regimen_duration.subject_id = params[:subject_regimen_duration][:subject_id]
   
    respond_to do |format|
      if @subject_regimen_duration.save
        @program = Program.new
        @programs = Program.all
        format.html { redirect_to :back}
        format.json { render :show, status: :created, location: @subject_regimen_duration }
      else
        format.html { render :new }
        format.json { render json: @subject_regimen_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_regimen_durations/1
  # PATCH/PUT /subject_regimen_durations/1.json
  def update
    respond_to do |format|
      if @subject_regimen_duration.update(subject_regimen_duration_params)
        format.html { redirect_to @subject_regimen_duration }
        format.json { render :show, status: :ok, location: @subject_regimen_duration }
      else
        format.html { render :edit }
        format.json { render json: @subject_regimen_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_regimen_durations/1
  # DELETE /subject_regimen_durations/1.json
  def destroy
    id = @subject_regimen_duration.regimen_duration.program_id
    @subject_regimen_duration.destroy
    respond_to do |format|
      format.html { redirect_to regimen_durations_path(id: id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_regimen_duration
      @subject_regimen_duration = SubjectRegimenDuration.find(params[:id])
    end
    def prueba
      puts "====="
      puts "prueba"
    @program = @subject_regimen_duration.regimen_duration.program
    @regimen_durations = @program.regimen_durations
    @subject_regimen_duration = SubjectRegimenDuration.new
    @subjects = Subject.all
    respond_to do |format|
      format.js {redirect_to "programs/update_regimen"}
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_regimen_duration_params
      params.require(:subject_regimen_duration).permit(:regimen_duration_id, :subject_id, :subject_regimen_duration_subject_id)
    end
end
