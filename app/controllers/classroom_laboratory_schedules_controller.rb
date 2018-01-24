class ClassroomLaboratorySchedulesController < ApplicationController
  before_action :set_classroom_laboratory_schedule, only: [:show, :edit, :update, :destroy]

  # GET /classroom_laboratory_schedules
  # GET /classroom_laboratory_schedules.json
  def index
    @classroom_laboratory_schedules = ClassroomLaboratorySchedule.all
  end

  # GET /classroom_laboratory_schedules/1
  # GET /classroom_laboratory_schedules/1.json
  def show
  end

  # GET /classroom_laboratory_schedules/new
  def new
    @classroom_laboratory_schedule = ClassroomLaboratorySchedule.new
  end

  # GET /classroom_laboratory_schedules/1/edit
  def edit
  end

  # POST /classroom_laboratory_schedules
  # POST /classroom_laboratory_schedules.json
  def create
    @classroom_laboratory_schedule = ClassroomLaboratorySchedule.new(classroom_laboratory_schedule_params)

    respond_to do |format|
      if @classroom_laboratory_schedule.save
        format.html { redirect_to @classroom_laboratory_schedule, notice: 'Classroom laboratory schedule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @classroom_laboratory_schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @classroom_laboratory_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classroom_laboratory_schedules/1
  # PATCH/PUT /classroom_laboratory_schedules/1.json
  def update
    respond_to do |format|
      if @classroom_laboratory_schedule.update(classroom_laboratory_schedule_params)
        format.html { redirect_to @classroom_laboratory_schedule, notice: 'Classroom laboratory schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classroom_laboratory_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classroom_laboratory_schedules/1
  # DELETE /classroom_laboratory_schedules/1.json
  def destroy
    @classroom_laboratory_schedule.destroy
    respond_to do |format|
      format.html { redirect_to classroom_laboratory_schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_laboratory_schedule
      @classroom_laboratory_schedule = ClassroomLaboratorySchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_laboratory_schedule_params
      params.require(:classroom_laboratory_schedule).permit(:classroom_laboratory_id, :schedule_id)
    end
end
