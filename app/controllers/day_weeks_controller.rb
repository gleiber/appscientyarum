class DayWeeksController < ApplicationController
  before_action :set_day_week, only: [:show, :edit, :update, :destroy]

  # GET /day_weeks
  # GET /day_weeks.json
  def index
    @day_weeks = DayWeek.all
  end

  # GET /day_weeks/1
  # GET /day_weeks/1.json
  def show
  end

  # GET /day_weeks/new
  def new
    @day_week = DayWeek.new
  end

  # GET /day_weeks/1/edit
  def edit
  end

  # POST /day_weeks
  # POST /day_weeks.json
  def create
    @day_week = DayWeek.new(day_week_params)

    respond_to do |format|
      if @day_week.save
        format.html { redirect_to '/maestricos/prueba?titulo=Dias+de+la+Semana&tabla=DayWeek' }
        format.json { render :show, status: :created, location: @day_week }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Dias+de+la+Semana&tabla=DayWeek' }
        format.json { render json: @day_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_weeks/1
  # PATCH/PUT /day_weeks/1.json
  def update
    respond_to do |format|
      if @day_week.update(day_week_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Dias+de+la+Semana&tabla=DayWeek'}
        format.json { render :show, status: :ok, location: @day_week }
      else
        format.html { render :edit }
        format.json { render json: @day_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_weeks/1
  # DELETE /day_weeks/1.json
  def destroy
    @day_week.destroy
    respond_to do |format|
      format.html { redirect_to day_weeks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_week
      @day_week = DayWeek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_week_params
      params.require(:day_week).permit(:descripcion)
    end
end
