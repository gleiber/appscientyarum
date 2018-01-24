class CohortPeriodsController < ApplicationController
  before_action :set_cohort_period, only: [:show, :edit, :update, :destroy]

  # GET /cohort_periods
  # GET /cohort_periods.json
  def index
    @cohort_periods = CohortPeriod.all
  end

  # GET /cohort_periods/1
  # GET /cohort_periods/1.json
  def show
  end

  # GET /cohort_periods/new
  def new
    @cohort_period = CohortPeriod.new
  end

  # GET /cohort_periods/1/edit
  def edit
  end

  # POST /cohort_periods
  # POST /cohort_periods.json
  def create
    @cohort_period = CohortPeriod.new(cohort_period_params)

    respond_to do |format|
      if @cohort_period.save
        format.html { redirect_to @cohort_period }
        format.json { render action: 'show', status: :created, location: @cohort_period }
      else
        format.html { render action: 'new' }
        format.json { render json: @cohort_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohort_periods/1
  # PATCH/PUT /cohort_periods/1.json
  def update
    respond_to do |format|
      if @cohort_period.update(cohort_period_params)
        format.html { redirect_to @cohort_period }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cohort_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohort_periods/1
  # DELETE /cohort_periods/1.json
  def destroy
    @cohort_period.destroy
    respond_to do |format|
      format.html { redirect_to cohort_periods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort_period
      @cohort_period = CohortPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cohort_period_params
      params.require(:cohort_period).permit(:cohort_id, :period_id)
    end
end
