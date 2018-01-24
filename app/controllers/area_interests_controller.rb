class AreaInterestsController < ApplicationController
  before_action :set_area_interest, only: [:show, :edit, :update, :destroy]

  # GET /area_interests
  # GET /area_interests.json
  def index
    #if params[:line_investigation_id]
    #  id = params[:line_investigation_id]
    #else
    #  id = params[:id]
    #end
    #@line_investigation = LineInvestigation.find(id)
    #@area_interests = @line_investigation.area_interests
    @area_interests = AreaInterest.all
  end

  # GET /area_interests/1
  # GET /area_interests/1.json
  def show
  end

  # GET /area_interests/new
  def new
    @line_investigation = LineInvestigation.find(params[:line_investigation])
    @area_interest = AreaInterest.new
  end

  # GET /area_interests/1/edit
  def edit
    
  end

  # POST /area_interests
  # POST /area_interests.json
  def create
    @area_interest = AreaInterest.new(area_interest_params)

    respond_to do |format|
      if @area_interest.save
        format.html { redirect_to "/area_line" , notice:'Area de interes creada exitosamente'}
        format.json { render action: 'show', status: :created, location: @area_interest }
      else
        format.html { redirect_to "/area_line" }
        format.json { render json: @area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_interests/1
  # PATCH/PUT /area_interests/1.json
  def update
    respond_to do |format|
      if @area_interest.update(area_interest_params)
        format.html { redirect_to area_interests_path(id: @area_interest.line_investigation_id) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_interests/1
  # DELETE /area_interests/1.json
  def destroy
    @area_interest.destroy
    respond_to do |format|
      format.html { redirect_to area_interests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_interest
      @area_interest = AreaInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_interest_params
      params.require(:area_interest).permit(:line_investigation_id, :descripcion, :line_investigation)
    end
end
