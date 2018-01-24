class WhyDcytsController < ApplicationController
  before_action :set_why_dcyt, only: [:show, :edit, :update, :destroy]

  # GET /why_dcyts
  # GET /why_dcyts.json
  def index
    @why_dcyts = WhyDcyt.all
  end
  # GET /why_dcyts/1
  # GET /why_dcyts/1.json
  def show
  end

  # GET /why_dcyts/new
  def new
    @why_dcyt = WhyDcyt.new
  end

  # GET /why_dcyts/1/edit
  def edit
  end

  # POST /why_dcyts
  # POST /why_dcyts.json
  def create
    @why_dcyt = WhyDcyt.new(why_dcyt_params)

    respond_to do |format|
      if @why_dcyt.save
        format.html { redirect_to '/maestricos/prueba?titulo=Por+que+DCYT&tabla=WhyDcyt'}
        format.json { render :show, status: :created, location: @why_dcyt }
      else
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/maestricos/prueba?titulo=Por+que+DCYT&tabla=WhyDcyt'}
        format.json { render json: @why_dcyt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /why_dcyts/1
  # PATCH/PUT /why_dcyts/1.json
  def update
    respond_to do |format|
      if @why_dcyt.update(why_dcyt_params)
        format.html { redirect_to '/maestricos/prueba?titulo=Por+que+DCYT&tabla=WhyDcyt' }
        format.json { render :show, status: :ok, location: @why_dcyt }
      else
        format.html { redirect_to '/maestricos/edit?tabla=WhyDcyt&tabla_id='+@why_dcyt.id.to_s }
        format.json { render json: @why_dcyt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /why_dcyts/1
  # DELETE /why_dcyts/1.json
  def destroy
    @why_dcyt.destroy
    respond_to do |format|
      format.html { redirect_to why_dcyts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_why_dcyt
      @why_dcyt = WhyDcyt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def why_dcyt_params
      params.require(:why_dcyt).permit(:descripcion)
    end
end
