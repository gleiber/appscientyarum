class SchPerUsController < ApplicationController
  before_action :set_sch_per_u, only: [:show, :edit, :update, :destroy]

  # GET /sch_per_us
  # GET /sch_per_us.json
  def index
    @sch_per_us = SchPerU.all
  end

  # GET /sch_per_us/1
  # GET /sch_per_us/1.json
  def show
  end

  # GET /sch_per_us/new
  def new
    @sch_per_u = SchPerU.new
  end

  # GET /sch_per_us/1/edit
  def edit
  end

  # POST /sch_per_us
  # POST /sch_per_us.json
  def create
    @sch_per_u = SchPerU.new(sch_per_u_params)

    respond_to do |format|
      if @sch_per_u.save
        format.html { redirect_to @sch_per_u}
        format.json { render action: 'show', status: :created, location: @sch_per_u }
      else
        format.html { render action: 'new' }
        format.json { render json: @sch_per_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sch_per_us/1
  # PATCH/PUT /sch_per_us/1.json
  def update
    respond_to do |format|
      if @sch_per_u.update(sch_per_u_params)
        format.html { redirect_to @sch_per_u}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sch_per_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sch_per_us/1
  # DELETE /sch_per_us/1.json
  def destroy
    @sch_per_u.destroy
    respond_to do |format|
      format.html { redirect_to sch_per_us_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sch_per_u
      @sch_per_u = SchPerU.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sch_per_u_params
      params.require(:sch_per_u).permit(:user_id, :coh_per_sub_u_id, :nota)
    end
end
