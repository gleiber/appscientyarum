class ScheduleCohortPeriodsController < ApplicationController
  before_action :set_schedule_cohort_period, only: [:show, :edit, :update, :destroy]

  # GET /schedule_cohort_periods
  # GET /schedule_cohort_periods.json
  def index
    @schedule_cohort_periods = ScheduleCohortPeriod.all
  end

  # GET /schedule_cohort_periods/1
  # GET /schedule_cohort_periods/1.json
  def show
  end

  # GET /schedule_cohort_periods/new
  def new
    @schedule_cohort_period = ScheduleCohortPeriod.new
  end

  # GET /schedule_cohort_periods/1/edit
  def edit
  end

  # POST /schedule_cohort_periods
  # POST /schedule_cohort_periods.json
  def create
    @schedule_cohort_period = ScheduleCohortPeriod.new(schedule_cohort_period_params)

    respond_to do |format|
      if @schedule_cohort_period.save
        format.html { redirect_to @schedule_cohort_period}
        format.json { render action: 'show', status: :created, location: @schedule_cohort_period }
      else
        format.html { render action: 'new' }
        format.json { render json: @schedule_cohort_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_cohort_periods/1
  # PATCH/PUT /schedule_cohort_periods/1.json
  def update
    respond_to do |format|
      if @schedule_cohort_period.update(schedule_cohort_period_params)
        format.html { redirect_to @schedule_cohort_period}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @schedule_cohort_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_cohort_periods/1
  # DELETE /schedule_cohort_periods/1.json
  def destroy
    @schedule_cohort_period.destroy
    respond_to do |format|
      format.html { redirect_to schedule_cohort_periods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_cohort_period
      @schedule_cohort_period = ScheduleCohortPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_cohort_period_params
      params.require(:schedule_cohort_period).permit(:schedule_id, :cohort_period_id)
    end
end
