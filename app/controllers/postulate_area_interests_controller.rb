class PostulateAreaInterestsController < ApplicationController
  before_action :set_postulate_area_interest, only: [:show, :edit, :update, :destroy]

  # GET /postulate_area_interests
  # GET /postulate_area_interests.json
  def index
    @postulate_area_interests = PostulateAreaInterest.all
  end

  # GET /postulate_area_interests/1
  # GET /postulate_area_interests/1.json
  def show
  end

  # GET /postulate_area_interests/new
  def new
    @postulate_area_interest = PostulateAreaInterest.new
  end

  # GET /postulate_area_interests/1/edit
  def edit
  end

  # POST /postulate_area_interests
  # POST /postulate_area_interests.json
  def create
    @postulate_area_interest = PostulateAreaInterest.new(postulate_area_interest_params)

    respond_to do |format|
      if @postulate_area_interest.save
        format.html { redirect_to @postulate_area_interest }
        format.json { render :show, status: :created, location: @postulate_area_interest }
      else
        format.html { render :new }
        format.json { render json: @postulate_area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulate_area_interests/1
  # PATCH/PUT /postulate_area_interests/1.json
  def update
    respond_to do |format|
      if @postulate_area_interest.update(postulate_area_interest_params)
        format.html { redirect_to @postulate_area_interest }
        format.json { render :show, status: :ok, location: @postulate_area_interest }
      else
        format.html { render :edit }
        format.json { render json: @postulate_area_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulate_area_interests/1
  # DELETE /postulate_area_interests/1.json
  def destroy
    @postulate_area_interest.destroy
    respond_to do |format|
      format.html { redirect_to postulate_area_interests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulate_area_interest
      @postulate_area_interest = PostulateAreaInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulate_area_interest_params
      params.require(:postulate_area_interest).permit(:area_interest_id, :postulate_id)
    end
end
